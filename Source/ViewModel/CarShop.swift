//
//  CarShop.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

import Foundation

class CarShop: ObservableObject {
    @Published var car: Car
    @Published var price: String = ""
    
    init() {
        car = Car.init(id: UUID(), name: "Porsche 911", price: 100000)
        price = String(format: "%.2f", car.price)
    }
    
    func setPrice(to value: Double) {
        car.updatePrice(to: value)
        car.updatePriceOnWebPage()
    }
}
