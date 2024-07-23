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
               layout(selectedDish: dish)
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


extension HomeView{
    private func layout(selectedDish dish:Dishes)->some View{
        VStack {
            HStack(spacing: 20) {
                if let imageURL = URL(string: dish.imageURL) {
                            AsyncImage(url: imageURL) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(.buttonBorder)
                            } placeholder: {
                                ProgressView() // Show an empty view while the image is loading
                            }
                        } else {
                           ProgressView() // Show an empty view if the image URL is invalid
                    }
                
//                Image("asian-flank-steak")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(dish.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
