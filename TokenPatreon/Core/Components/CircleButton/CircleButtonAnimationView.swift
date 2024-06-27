//
//  CircleButtonAnimationView.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 27/06/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding  var animate:Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0): Animation.easeIn(duration: 1.0) )
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}
