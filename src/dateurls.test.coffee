require('docpad').require('testers')
  .test(
      testerName: 'dateurls with file extension'
      pluginPath: __dirname+'/..'
      testPath: __dirname+'/../test/fileextension'
      autoExit: 'safe'
    ,
      plugins:
        dateurls:
          cleanurl: false
  )

  .test(
      testerName: 'dateurls cleanurls'
      pluginPath: __dirname+'/..'
      testPath: __dirname+'/../test/cleanurls'
      autoExit: 'safe'
    ,
      plugins:
        dateurls:
          cleanurl: true
  )

  .test(
      testerName: 'dateurls with trailing slashs'
      pluginPath: __dirname+'/..'
      testPath: __dirname+'/../test/trailingslash'
    ,
      plugins:
        dateurls:
          cleanurl: true
          trailingSlashes: true
  )