//
//  UpbitAPI.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import Foundation

typealias Markets = [Market]

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket(completion: @escaping (Markets) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {  /// URLSession 내부에서 background로 처리하기 때문에 UI 업데이트 해주기 전 메인 스레드로 변경해주기.
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchAllMarket() async throws -> Markets {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(Markets.self, from: data)
        
        return decodedData
    }
    
    
    
}

