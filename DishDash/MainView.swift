//
//  ContentView.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
           HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            AccountView()
                .tabItem {
                    Text("Account")
                    Image(systemName: "person.crop.circle")
                }
            CheckoutView()
                .tabItem {
                    Text("Checkout")
                    Image(systemName: "list.bullet.clipboard")
                }
            
        }
    }
}

#Preview {
    MainView()
}
