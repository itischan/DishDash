//
//  Order.swift
//  DishDash
//
//  Created by ck on 2024-07-25.
//

import Foundation


final class Order:ObservableObject{
    @Published var items:[Dishes] = []
}
