Meshblu = require 'meshblu'
MeshbluConfig = require 'meshblu-config'
debug = require('debug')('meshblu-http-proxy-consumer-example')

PROXY_UUID = process.env.PROXY_UUID

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
