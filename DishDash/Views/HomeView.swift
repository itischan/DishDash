//
//  HomeView.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import SwiftUI

struct HomeView: View {
    @State var dishes: [Dishes] = []

    var body: some View {
        NavigationStack {
            List(dishes) { dish in
                VStack {
                    HStack(spacing: 20) {
                        Image("asian-flank-steak")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text(dish.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .onAppear {
                Task {
                    await loadDishes()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Sea of Dishes")
        }
    }
    
    func loadDishes() async {
        do {
            let fetchedDishes = try await NetworkManager.shared.getDish()
            dishes = fetchedDishes
        } catch {
            print("Error fetching dishes: \(error)")
        }
    }
}

#Preview {
    HomeView()
}
