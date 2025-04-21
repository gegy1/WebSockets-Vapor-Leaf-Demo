//
//  WebRouteCollection.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 20.04.25.
//

import Foundation
import Vapor


class WebRouteCollection: RouteCollection {
    private var webSockets: [WebSocket] = []
    private var carShop: CarShop // Füge eine Eigenschaft für CarShop hinzu
    
    init(carShop: CarShop) {
        self.carShop = carShop // Initialisiere die Eigenschaft
    }
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: IndexViewHandler)
        routes.webSocket("ws", onUpgrade: webSocketHandler)
    }
    
    func IndexViewHandler(_ req: Request) async throws -> View {
        let car = carShop.car
        let context = CarContext(car: car)
        return try await req.view.render("index", context)
    }
    
    struct CarContext: Encodable {
        var car: Car
    }
    
    func webSocketHandler(req: Request, ws: WebSocket) {
        WebSocketManager.shared.add(ws)
        ws.onText { ws, text in
            
        }
        
        ws.onClose.whenComplete { result in
            WebSocketManager.shared.remove(ws)
        }
    }
    
    
}
