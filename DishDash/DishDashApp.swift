//
//  DishDashApp.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import SwiftUI

@main
struct DishDashApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
