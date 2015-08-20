Meshblu = require 'meshblu'
MeshbluConfig = require 'meshblu-config'
debug = require('debug')('proxy-consumer')

PROXY_UUID = '3ab8f03d-bcbf-479f-9403-3c84e8759047'

class Command
  constructor: ->
    @config = new MeshbluConfig

  run: =>
    @meshblu = Meshblu.createConnection @config.toJSON()
    @meshblu.on 'ready', =>
      debug 'ready'
      @startMessaging()

    @meshblu.on 'message', @onMessage

  onMessage: (message) =>
    return console.error message.payload.error if message.payload.error?
    debug 'onMessage statusCode',  message.payload.statusCode
    console.log message.payload.body
    process.exit 0

  startMessaging: =>
    @meshblu.message PROXY_UUID, {foo: 'bar', magic: true}

command = new Command
command.run()
