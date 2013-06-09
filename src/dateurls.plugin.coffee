post_date_regex = new RegExp("([0-9]+-)*")
moment = require('moment')

# Export Plugin 
module.exports = (BasePlugin) ->

	class DateUrls extends BasePlugin

		name: 'dateurls'

		config: 
						enabled: true
						documentPath: 'posts'
						cleanurl: false

		renderBefore: (opts, next) ->
			{collection, templateData} = opts
			config = @config



			if config.enabled 
				if config.cleanurl
					getFilename = 'basename'
				else
					getFilename = 'outFilename'
				documents = @docpad.getCollection('documents').findAllLive({relativeDirPath: config.documentPath}, [date: -1])
				documents.forEach (document) ->
					dateUrl = moment.utc(document.getMeta('date')).format('/YYYY/MM/DD')+"/"+document.get(getFilename).replace(post_date_regex,'')
					document.setUrl(dateUrl)

			return next()