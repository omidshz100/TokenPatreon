//
//  CoinImageViewModel.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import Foundation
import Combine
import SwiftUI

class CointImageViewModel: ObservableObject{
    
    @Published var image:UIImage? = nil
    @Published var isLoading:Bool = true
    
    private let coin:CoinModel
    private let dataService:CoinImageService
    private var cancelabale = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancelabale)

    }
}
