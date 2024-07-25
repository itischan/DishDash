//
//  CartView.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        NavigationStack{
            List{
                ForEach(order.items){dish in
                    layout(selectedDish: dish)
                }
            }.listStyle(PlainListStyle())
                .navigationTitle("Check out")
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}


extension CheckoutView{
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
                
              
                VStack {
                    Text(dish.name)
                        .font(.headline)
                    .frame(maxWidth: .infinity)
                    Text("$ \(dish.price,specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                }
                
            }
        }
    }
}
