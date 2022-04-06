//
//  CityDetailView.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import SwiftUI

//Takes in a city
//Uses the city attributes to display information about the city
//Can click the star icon to add or unadd a city to favorites

struct CityDetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    var city: City
    
    var cityIndex: Int {
            modelData.cities.firstIndex(where: { $0.id == city.id })!
        }
    
    var body: some View {
        ScrollView {
            city.image!
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .clipShape(Circle())
                .padding()
                
                .overlay {
                    Circle().stroke(.white, lineWidth:4)
                    
                }
                .shadow(radius: 7)
                
            VStack(alignment: .leading){
                
                HStack {
                    Text(city.name)
                        .font(.custom("Copperplate", size: 30))
                    FavoriteButtonView(isSet: $modelData.cities[cityIndex].isFavorite)
                }
                
                
                Text(city.country)
                    .font(.subheadline)
                
                Divider()
                
                Text("About \(city.name)...")
                    .font(.title2)
                Text(city.description)
                    .font(.caption)
                
            }
            .padding()
            .frame(width: 400.0)
        }
        .navigationTitle(city.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var Cities = ModelData().cities
    static var previews: some View {
        
        CityDetailView(city: Cities[3])
            .environmentObject(ModelData())
    }
}
