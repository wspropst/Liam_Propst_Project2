//
//  Project2App.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import SwiftUI

@main
struct Project2App: App {
    
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
