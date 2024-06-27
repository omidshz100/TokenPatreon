//
//  CoinModel.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 27/06/24.
//

import Foundation
import SwiftUI

// CoinGecko API info ....

// Description of the Code
/**
 
 URL :
 
    https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h
 
 
 {
     "id": "yield-guild-games",
     "symbol": "ygg",
     "name": "Yield Guild Games",
     "image": "https://coin-images.coingecko.com/coins/images/17358/large/Shield_Mark_-_Colored_-_Iridescent.png?1696516909",
     "current_price": 0.596397,
     "market_cap": 224515036,
     "market_cap_rank": 251,
     "fully_diluted_valuation": 596642208,
     "total_volume": 48362265,
     "high_24h": 0.603653,
     "low_24h": 0.555336,
     "price_change_24h": 0.01961676,
     "price_change_percentage_24h": 3.40108,
     "market_cap_change_24h": 7553451,
     "market_cap_change_percentage_24h": 3.48147,
     "circulating_supply": 376297608.04261065,
     "total_supply": 1000000000,
     "max_supply": 1000000000,
     "ath": 11.17,
     "ath_change_percentage": -94.66817,
     "ath_date": "2021-11-20T16:49:03.371Z",
     "atl": 0.125601,
     "atl_change_percentage": 374.2465,
     "atl_date": "2023-06-10T04:36:01.024Z",
     "roi": null,
     "last_updated": "2024-06-27T15:51:35.634Z",
     "sparkline_in_7d": {
       "price": [
         0.5582273737927068,
         0.5611954223931668,
         0.5611243737574171,
         0.5712910718171659,
         0.5738861195103631
       ]
     },
     "price_change_percentage_24h_in_currency": 3.4010813753578457
   }
 
 
 
 */

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

struct Welcome {
    let id, symbol, name: String?
    let image: String?
    let currentPrice: Double?
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Int?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Int?
    let marketCapChangePercentage24H, circulatingSupply: Double?
    let totalSupply, maxSupply: Int?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let roi: NSNull?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
}

// MARK: - SparklineIn7D
struct SparklineIn7D {
    let price: [Double]?
}




