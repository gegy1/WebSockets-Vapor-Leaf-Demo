//
//  WebSockets_Vapor_Leaf_DemoApp.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

import SwiftUI

@main
struct WebSockets_Vapor_Leaf_DemoApp: App {
    // Create the view model on app level to use it in ios and for vapor
    @StateObject private var carShop = CarShop()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(carShop)
                .onAppear {
                    Task {
                        let localWebServer = await WebServer(port: 8080)
                        localWebServer.start(carShop: carShop)
                    }
                }
        }
        
    }
}
