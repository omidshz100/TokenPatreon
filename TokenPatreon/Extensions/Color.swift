//
//  Color.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 21/06/24.
//

import Foundation
import SwiftUI


extension Color {
    
    // with this static variable we can access to all properties from this ColorThem Extension
    static let them = ColorThem()
    
    struct ColorThem {
        let accent = Color("AccentColor")
        let background = Color("BackgroundColor")
        let green = Color("GreenColor")
        let red = Color("RedColor")
        let secondaryText = Color("SecondaryTextColor")
    }
    
}
