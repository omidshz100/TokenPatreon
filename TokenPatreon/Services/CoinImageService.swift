//
//  CoinImageService.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import Foundation
import SwiftUI
import Combine


class CoinImageService {
    
    
    @Published var image: UIImage? = nil 
    private var imageSubscription: AnyCancellable?
    private let coin:CoinModel
    init(coin:CoinModel){
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage(){
        guard let url = URL(string: self.coin.image) else { return}
        
        imageSubscription = NetworkingManager.download(url)
            .tryMap({ (data)-> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returrnedImage in
                self?.image = returrnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
