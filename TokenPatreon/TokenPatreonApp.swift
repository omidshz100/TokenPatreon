//
//  TokenPatreonApp.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 21/06/24.
//

import SwiftUI

@main
struct TokenPatreonApp: App {
    @StateObject var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
