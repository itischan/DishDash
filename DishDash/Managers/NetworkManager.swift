//
//  NetworkManager.swift
//  DishDash
//
//  Created by ck on 2024-07-22.
//

import Foundation




final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    static let sampleUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let baseUrl = sampleUrl + "/appetizers"
    
    func getDish() async throws -> [Dishes] {
        guard let url = URL(string: baseUrl) else {
            throw MyErrors.noData
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(DishesResponse.self, from: data)
            return results.request
        } catch {
            throw MyErrors.noData
        }
    }
}
