//
//  CircleButtinView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 25/06/24.
//

import SwiftUI

struct CircleButtinView: View {
    var iconeName:String
    var body: some View {
        Image(systemName: iconeName)
            .font(.headline)
            .foregroundStyle(Color.them.accent)
            .frame(width: 50, height: 50)
            .background(
                ZStack{
                    Circle()
                        .foregroundStyle(Color.them.background)
                }
            )
            .shadow(color: Color.them.accent.opacity(0.25),radius: 10, x: 0, y: 0)
            .padding()
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CircleButtinView(iconeName: "info")
                .previewLayout(.sizeThatFits)
            CircleButtinView(iconeName: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
             
        }
    }
}


