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


    renderBefore: (opts, next) ->
      {collection, templateData} = opts
      config = @config


      console.log('hello: ' + config.cleanurl)
      if config.enabled 
        if config.cleanurl
          getFilename = 'basename'
          trailingSlashes = @config.trailingSlashes
        else
          getFilename = 'outFilename'
        documents = @docpad.getCollection('documents').findAllLive({relativeDirPath: config.documentPath}, [date: -1])
        documents.forEach (document) ->
          dateUrl = moment.utc(document.getMeta('date')).format('/YYYY/MM/DD')+"/"+document.get(getFilename).replace(post_date_regex,'')
          if config.cleanurl
              document.setUrl(dateUrl + if trailingSlashes then '/' else '')
              document.addUrl(dateUrl + if trailingSlashes then '' else '/')
          else
              document.setUrl(dateUrl)

          return next()