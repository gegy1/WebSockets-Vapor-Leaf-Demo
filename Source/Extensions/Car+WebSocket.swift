//
//  Car+WebSocket.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

extension Car {
    func updatePriceOnWebPage() {
        // Send the message to the websocket
        let message = "{\"id\": \"\(self.id)\", \"price\": \(price)}"
        WebSocketManager.shared.broadcast(message)
    }
}
