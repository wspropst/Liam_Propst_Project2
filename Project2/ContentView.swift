//
//  ContentView.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        CityListView()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
