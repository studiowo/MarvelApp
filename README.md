# Marve App

O objetivo deste aplicativo era exibir os herois da Marvel, ordenados pelos últimos atualizados, utilizando a API da marvel (developer.marvel.com)


## Project Architecture
**M**(Data) - **V**(Feature) - **C**(Coordinator):

## View layer Architecture
**MVVM** (ViewControllers) e **MVP** (Collection)

## Frameworks
**SDK**

The project uses an SDK as a network layer artifact, abstracting the entire request part within the **Fetchable** protocol.
To use it, you need to initialize it in **AppDelegate**:

```swift
let environment = HMACEnvironment(baseURL: Environment.baseUrl,
                                  apiKey: Environment.publicKey,
                                  hash: "\(Environment.privateKey)\(Environment.publicKey)", sslCertificates: [])
        
SDKEnvironment(authType: .hmac(urlEnvironment: environment),
               accessCode: "1234567890",
               window: window, authProtocol: self).setup()
```
To start the SDK, you need to instantiate a ```SDKEnvironment``` that takes three parameters: authentication type, an accessCode, a window and an authProtocol.

Currently the authentication types supported by the SDK are ```HMAC``` and ```Grant```.

## Testes
The project has a testing target called **MarvelAppTests**. The suite is covering unit testing, instrumented testing, and UI testing..

The app has a Mock configuration to run the tests, which uses the [Mux](https://github.com/gorilla/mux) as a router, returning the mock located in the directory MarvelAppTests/Mock/.
To run the tests you need to configure it in your environment.

Current test coverage is **77,5%**.

## Third party libraries
- Alamofire
- AlamofireNetworkActivityLogger
- Toast-Swift*

*Declared in Podfile, but not used in this project

