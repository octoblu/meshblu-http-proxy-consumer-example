# meshblu-http-proxy-consumer-example


### To setup:

```shell
npm install
npm install -g meshblu-util
meshblu-util register --open > meshblu.json
```

*Note: Creating an open device like this is not recommended for production use. In production, you would want to lock down the permissions to only those devices that should be allowed to message your device.*

### To run:

`<PROXY_UUID>` is the UUID of the http-proxy
device, and can be found in that device's `meshblu.json`

```shell
PROXY_UUID=<PROXY_UUID> npm start
```

This project uses `debug`, so to get more information, try these variants with increasing levels of information:

```shell
DEBUG=meshblu-http-proxy-consumer-example npm start
DEBUG=meshblu* npm start
DEBUG=* npm start
```
