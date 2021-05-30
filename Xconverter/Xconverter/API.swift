//
//  API.swift
//  Xconverter
//
//  Created by Sem Moolenschot on 5/30/21.
//

import SwiftUI

class API: ObservableObject {
    
    // Notify changes to all listeners
    @Published var currencyCode: [String] = []
    @Published var buyingPrice: [Double] = []
    @Published var symbolArray: [String] = []
    
    init() {
        fetchCryptoData { (bitcoin) in
            switch bitcoin {
            case .success(let currency):
                currency.forEach { (currencies) in
                    DispatchQueue.main.sync {
                        self.currencyCode.append(currencies.key)
                        self.symbolArray.append(currencies.value.symbol)
                        self.buyingPrice.append(currencies.value.buy)
                    }
                }
            case.failure(let error):
                print("Failed to fetch bitcoin data", error)
            }
        }
    }
    
    
    func fetchCryptoData(completion: @escaping (Result<Bitcoin, Error>)->()) {
        guard let url = URL(string: "https://blockchain.info/ticker") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let safeData = data else { return }
            
            do {
                let bitcoin = try JSONDecoder().decode(Bitcoin.self, from: safeData)
                completion(.success(bitcoin))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
