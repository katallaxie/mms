//
//  main.swift
//  PrivilegesXPC
//
//  Created by Sebastian Döll on 17.11.23.
//

import SecureXPC
import os

// Set up new structured logger
let logger = Logger(subsystem:  "me.katallaxie.PrivilegesXPC", category: "main")
logger.info("OSLogMessage")

// Set up XPC routing.
let route = XPCRoute.named("bedazzle")
                    .withMessageType(String.self)
                    .withReplyType(Bool.self)

let server = XPCServer.makeAnonymous()
server.registerRoute(route, handler: bedazzle)

// Setup the listener and start listening for connections.
server.startAndBlock()

private func bedazzle(message: String) throws -> Bool {
    return true
}

// Set up the listener and start listening for connections.
// startListener()

// Create the listener that receives incoming session requests from clients.
//func startListener() {
//    do {
//        _ = try XPCListener(service: "me.katallaxie.PrivilegesXPC") { request in
//            // When a session request arrives, you must either accept or reject it.
//            // The listener invokes the closure you specify every time a
//            // message is received.
//            request.accept { message in
//                // Perform the work that the service offers.
//                return performTask(with: message)
//            }
//        }
//
//        // Start the main dispatch queue to begin processing messages.
//        dispatchMain()
//    } catch {
//        print("Failed to create listener, error: \(error)")
//    }
//}
//
//// The function that performs the work of the service.
//func performTask(with message: XPCReceivedMessage) -> Encodable? {
//    do {
//        // Decode the message from the received message.
//        let request = try message.decode(as: CalculationRequest.self)
//
//        // Return an encodable response that will get sent back to the client.
//        return CalculationResponse(result: request.firstNumber + request.secondNumber)
//    } catch {
//        print("Failed to decode received message, error: \(error)")
//        return nil
//    }
//}

/*

 To use this service from an app or other process, use XPCSession to establish a connection to the service.
 
    do {
        session = try XPCSession(xpcService: "me.katallaxie.PrivilegesXPC")
    } catch {
        print("Failed to connect to listener, error: \(error)")
    }

 Once you have a connection to the service, create a Codable request and send it to the service.

    do {
        let request = CalculationRequest(firstNumber: 23, secondNumber: 19)
        let reply = try session.sendSync(request)
        let response = try reply.decode(as: CalculationResponse.self)

        DispatchQueue.main.async {
            print("Received response with result: \(response.result)")
        }
    } catch {
        print("Failed to send message or decode reply: \(error.localizedDescription)")
    }

 When you're done using the connection, cancel it by doing the following:
 
    session.cancel(reason: "Done with calculation")

 */
