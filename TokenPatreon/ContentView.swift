//
//  ContentView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 21/06/24.
//

import SwiftUI
// init
struct ContentView: View {
    var body: some View {
        ZStack{
            Color.them.background
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundStyle(Color.them.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(Color.them.secondaryText)
                Text("Red Text Color")
                    .foregroundStyle(Color.them.red)
                Text("Green Text Color")
                    .foregroundStyle(Color.them.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
