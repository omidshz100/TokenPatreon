//
//  CoinImageView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import SwiftUI





struct CoinImageView: View {
    
    @StateObject var vm:CointImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CointImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading {
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.them.secondaryText)
            }
        }
    }
}



struct CoinImageView_Preview:PreviewProvider{
    static var previews: some View{
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits )
    }
}
