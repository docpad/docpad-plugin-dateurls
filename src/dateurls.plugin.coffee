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

    extendCollections: (opts) ->
      config = @config
      if config.collectionName?
        # Chain
        return @

      # only create our own collection if there wasn't an existing collection specified in the config
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
          dateUrl = moment.utc(document.getMeta('date')).format('/YYYY/MM/DD')+"/"+document.get(getFilename).replace(post_date_regex,'')
          if config.cleanurl
              document.setUrl(dateUrl + if trailingSlashes then '/' else '')
              document.addUrl(dateUrl + if trailingSlashes then '' else '/')
          else
              document.setUrl(dateUrl)

          return next()