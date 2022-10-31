//
//  SwiftfulMaoAppApp.swift
//  SwiftfulMaoApp
//
//  Created by Luana Moraes on 24/08/22.
//

import SwiftUI

@main
struct SwiftfulMaoAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
