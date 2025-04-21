//
//  WebServer.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 20.04.25.
//

import Foundation
import Leaf
import Vapor

class WebServer: ObservableObject {
    var app: Application
    let port: Int
    
    init(port: Int) async {
        self.port = port
        do {
            app = try await Application.make(.development) //.production for release
            configure(app)
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    private func configure(_ app: Application) {
        // 1
        app.http.server.configuration.hostname = "0.0.0.0"
        app.http.server.configuration.port = port
        
        app.views.use(.leaf)
        app.leaf.cache.isEnabled = app.environment.isRelease
        app.leaf.configuration.rootDirectory = Bundle.main.bundlePath
        app.routes.defaultMaxBodySize = "50MB"
    }
    
    func start(carShop: CarShop) {
        Task(priority: .background) {
            do {
                try app.register(collection: WebRouteCollection(carShop: carShop))
                try await app.startup()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
