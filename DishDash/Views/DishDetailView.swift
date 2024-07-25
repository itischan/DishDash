//
//  DishDetailView.swift
//  DishDash
//
//  Created by ck on 2024-07-23.
//

import SwiftUI

struct DishDetailView: View {
    let selectedDish:Dishes
    @Binding var isShowingDetail:Bool
    @EnvironmentObject var order:Order
    
    var body: some View {
        Spacer()
       
        VStack(alignment: .center, spacing:10){

                
            if let imageURL = URL(string: selectedDish.imageURL) {
                        AsyncImage(url: imageURL) { image in
                            image.resizable()
                                        
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300,height: 250)
                                
                        } placeholder: {
                            ProgressView() // Show an empty view while the image is loading
                        }
                    } else {
                       ProgressView() // Show an empty view if the image URL is invalid
                }
            Spacer()
            Text(selectedDish.name )
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            Text(selectedDish.description)
                .font(.title2)
            Spacer()
            HStack(spacing:20){
                VStack{
                Text("Calories")
                    Text("\(selectedDish.calories) g")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                
                
            }
                VStack{
                Text("Protein")
                    Text("\(selectedDish.protein) g")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                
                
            }
                VStack{
                Text("Carbs")
                    Text("\(selectedDish.carbs) g")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                
                
            }
               
                
            }.padding(.bottom)
            
            Button(action: {
                order.items.append(selectedDish)
                isShowingDetail = false
            }, label: {
                DishButton(title: "\(selectedDish.price) $ - ADD TO ORDER")
                    .padding(.bottom)
            })
            
            
        }.frame(maxWidth: .infinity)
            .frame(height: 500)
            .padding(.horizontal,10)
            
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .background(Color.teal.opacity(0.5))
            .padding()
            .clipShape(.buttonBorder)
            .overlay(alignment: .topTrailing) {
                Circle()
                    .frame(width: 50,height: 50)
                    .foregroundStyle(Color.teal.opacity(0.5))
                Button(action: {
                    isShowingDetail = false
                }, label: {
                    Image(systemName: "xmark")
                })
                
            }.padding(.all)
            

        Spacer()
    }
}

#Preview {
    DishDetailView(selectedDish: MockData.orderItemOne, isShowingDetail: .constant(true))
}
