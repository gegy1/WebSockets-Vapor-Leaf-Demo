//
//  ContentView.swift
//  WebSockets Vapor Leaf Demo
//
//  Created by Georg D. on 21.04.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var carShop: CarShop
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Image(systemName: "car.side")
                .imageScale(.large)
                .scaleEffect(2.0)
                .opacity(isAnimating ? 1.0 : 0.0)
                .padding()
                .foregroundStyle(.tint)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                        isAnimating = true
                    }
                }
            Text(carShop.car.name)
            Text("Current Price: \(String(format: "%.2f", carShop.car.price)) $")
            HStack {
                Button("Set new Price: ") {
                    if let newPrice = Double(carShop.price) {
                        carShop.setPrice(to: newPrice)
                    } else {
                        print("No valid double")
                    }
                }
                TextField("Enter new Price", text: $carShop.price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.decimalPad)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
//String(format: "%.2f", randomAverage)
