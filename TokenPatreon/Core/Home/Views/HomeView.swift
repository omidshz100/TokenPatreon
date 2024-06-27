//
//  HomeView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 21/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio:Bool = false
    var body: some View {
        ZStack{
            // Background Color
            Color.them.background
        // Content layer
            VStack{
                /// pase the variable hew
                homeHeader
                    .padding(.horizontal)
                Spacer(minLength: 0)
            }
        }
        .navigationTitle("ksjdnf")
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .toolbar(.hidden)
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
}
