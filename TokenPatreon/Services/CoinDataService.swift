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
        
        coinsSubscription = NetworkingManager.download(url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returrnedCoins in
                self?.allCoins = returrnedCoins
                self?.coinsSubscription?.cancel()
            })
    }
}
