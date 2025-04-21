//
//  WebSocketManager.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

import Vapor

class WebSocketManager {
    static let shared = WebSocketManager()
    private var sockets: [WebSocket] = []
   
    
    func add(_ socket: WebSocket) {
        sockets.append(socket)
    }
    
    func remove(_ socket: WebSocket) {
        // Entferne den Socket aus der Liste
        if let index = sockets.firstIndex(where: { $0 === socket }) {
            sockets.remove(at: index)
        }
    }
    
    func broadcast(_ message: String) {
        for socket in sockets {
            socket.send(message)
        }
    }
}
