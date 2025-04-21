//
//  Car.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

import Foundation


public struct Car: Codable {
    public let id: UUID
    public let name: String
    public var price: Double
    
    mutating func updatePrice(to value: Double) {
           price = value 
    }
    
}
