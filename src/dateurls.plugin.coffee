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
            trailingSlashes: false
            collectionName: null
            dateFormat: '/YYYY/MM/DD'

    extendCollections: (opts) ->
      config = @config

      # if the name of a pre-existing collection is passed in, skip the rest
      # of this function since we don't need to create out own collection
      if config.collectionName?
        # Chain
        return @

      # since no pre-existing collection was specified, create one based on
      # the configured documentPath
      docpad = @docpad
      config.collectionName = '_dateurlsPosts'
      docpad.setCollection config.collectionName, docpad.getCollection('documents').findAllLive({relativeDirPath: config.documentPath})

      # Chain
      return @

    renderBefore: (opts, next) ->
      {collection, templateData} = opts
      config = @config

      if config.enabled 
        if config.cleanurl
          getFilename = 'basename'
          trailingSlashes = @config.trailingSlashes
        else
          getFilename = 'outFilename'
        documents = @docpad.getCollection(config.collectionName)
        documents.forEach (document) ->
          filename = document.get(getFilename)
          if document.getMeta('dateurls-exclude')
            console.log('dateurls excluding', filename)
          else
            console.log('dateurls including', filename)
            dateUrl = moment.utc(document.getMeta('date')).format(config.dateFormat)+"/"+filename.replace(post_date_regex,'')
            if config.cleanurl
              document.setUrl(dateUrl + if trailingSlashes then '/' else '')
              document.addUrl(dateUrl + if trailingSlashes then '' else '/')
            else
                document.setUrl(dateUrl)

      return next()
