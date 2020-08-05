// @ts-nocheck
'use strict'

const regex = new RegExp('([0-9]+-)*')
const moment = require('moment')

// Export Plugin
module.exports = function (BasePlugin) {
	return class DateUrls extends BasePlugin {
		get name() {
			return 'dateurls'
		}

		get initialConfig() {
			return {
				enabled: true,
				documentPath: 'posts',
				cleanurl: false,
				trailingSlashes: false,
				collectionName: null,
				dateFormat: '/YYYY/MM/DD',
			}
		}

		extendCollections() {
			const { docpad, config } = this

			// if the name of a pre-existing collection is passed in, skip the rest
			// of this function since we don't need to create out own collection
			if (config.collectionName != null) {
				// Chain
				return
			}

			// since no pre-existing collection was specified, create one based on
			// the configured documentPath
			config.collectionName = '_dateurlsPosts'
			docpad.setCollection(
				config.collectionName,
				docpad
					.getCollection('documents')
					.findAllLive({ relativeDirPath: config.documentPath })
			)

			return
		}

		renderBefore(opts, next) {
			const { config, docpad } = this
			let filename, trailingSlashes, documents

			if (config.enabled) {
				if (config.cleanurl) {
					filename = 'basename'
					trailingSlashes = config.trailingSlashes
				} else {
					filename = 'outFilename'
				}

				documents = docpad.getCollection(config.collectionName)

				documents.forEach(function (document) {
					const dateUrl =
						moment.utc(document.getMeta('date')).format(config.dateFormat) +
						'/' +
						document.get(filename).replace(regex, '')

					if (config.cleanurl) {
						document.setUrl(dateUrl + (trailingSlashes ? '/' : ''))
						document.addUrl(dateUrl + (trailingSlashes ? '' : '/'))
					} else {
						document.setUrl(dateUrl)
					}
				})
			}

			next()
		}
	}
}
