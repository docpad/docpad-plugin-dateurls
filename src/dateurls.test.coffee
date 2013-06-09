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
    ,
      plugins:
        dateurls:
          cleanurl: true
  )