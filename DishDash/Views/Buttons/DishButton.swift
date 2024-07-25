//
//  DishButton.swift
//  DishDash
//
//  Created by ck on 2024-07-25.
//

import SwiftUI

struct DishButton: View {
    let title:String
    var body: some View {
        Text(title)
            .font(.headline)
            .bold()
            .frame(width: 300,height: 100)
            .foregroundStyle(.white)
            .background(LinearGradient(colors: [.red.opacity(0.5),.blue.opacity(0.7)], startPoint:.topLeading, endPoint: .bottomTrailing))
            .clipShape(.buttonBorder)
    }
}

#Preview {
    DishButton(title: "Some title")
}
