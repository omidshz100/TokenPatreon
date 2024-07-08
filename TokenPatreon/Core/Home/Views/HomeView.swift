//
//  HomeView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 21/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio:Bool = false
    // we recieve it from Environment Object 
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack{
            // Background Color
            Color.them.background
        // Content layer
            VStack{
                /// pase the variable hew 
                homeHeader
                
                columnTitles
                .font(.caption)
                .foregroundColor(Color.them.secondaryText)
                .padding(.horizontal)
                    .padding(.horizontal)
                if !showPortfolio{
                    allCointList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCointList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
        .navigationTitle("ksjdnf")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .toolbar(.hidden)
            .environmentObject(dev.homeVM)
    }
}
extension HomeView {
    var homeHeader: some View {
        HStack{
            CircleButtinView(iconeName: showPortfolio ? "plus":"info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                
            Spacer()
            Text(showPortfolio ? "Portfolio":"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.them.accent)
            Spacer()
            CircleButtinView(iconeName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180:0))
                .onTapGesture {
                    withAnimation(.spring){
                        showPortfolio.toggle()
                    }
                }
        }
    }
    
    var allCointList: some View {
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 0, leading: 10.0, bottom: 0, trailing: 10.0))
            }
        }
        .listStyle(.plain) // what does .plain mean?
    }
    
    var portfolioCointList: some View {
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 0, leading: 10.0, bottom: 0, trailing: 10.0))
            }
        }
        .listStyle(.plain) // what does .plain mean?
    }
    
    var columnTitles: some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holding")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
    }
}
