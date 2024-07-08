//
//  CoinDataService.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins:[CoinModel] = [CoinModel]()
    var coinsSubscription: AnyCancellable?
    
    
     
    init(){
        getCoins()
    }
    
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return}
        
        coinsSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output)->Data in
                guard let respomse = output.response as? HTTPURLResponse,
                      respomse.statusCode >= 200 && respomse.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                      }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let erro):
                    print(erro.localizedDescription)
                }
            } receiveValue: { [weak self] returrnedCoins in
                self?.allCoins = returrnedCoins
                self?.coinsSubscription?.cancel()
            }
    }
}
