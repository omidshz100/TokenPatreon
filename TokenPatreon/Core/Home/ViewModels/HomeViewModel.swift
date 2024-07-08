//
//  HomeViewModel.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins:[CoinModel] = []
    
    private let coinDataService = CoinDataService()
    private var cancelables = Set<AnyCancellable>()
    
    
    init() {
      getData()
    }
    
    func getData(){
        coinDataService.$allCoins
            .sink { [weak self] recievedData in
                self?.allCoins = recievedData
            }.store(in: &cancelables)
    }
}
