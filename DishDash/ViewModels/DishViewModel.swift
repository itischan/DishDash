//
//  DishViewModel.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import Foundation


class DishViewModel:ObservableObject{
    @Published var orders : [Dishes] = []
   
    
    func getOrders(){
        
    }
}
