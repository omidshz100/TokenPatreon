//
//  CoinRowView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 30/06/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    var showHoldingColumn:Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline )
    }
}
struct CoinRowView_Previews: PreviewProvider{
    static var previews: some View{
        Group{
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
extension CoinRowView {
    private var leftColumn: some View {
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.them.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.them.accent)
        }
    }
    private var centerColumn: some View {
        VStack(alignment:.trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.them.accent)
    }
    private var rightColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.them.accent)
            Text((coin.priceChange24H ?? 0).asPercentString())
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.them.green :
                        Color.them.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
