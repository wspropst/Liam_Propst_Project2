//
//  CityRowView.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import SwiftUI

//This is the individual row view of the city.


struct CityRowView: View {
    var city: City
    
    var body: some View {
        HStack {
            city.image!
                .resizable()
                .frame(width: 50, height: 50)
            Text(city.name)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
            
            if city.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct CityRowView_Previews: PreviewProvider {
    static var cities = ModelData().cities
    
    static var previews: some View {
        
        CityRowView(city: cities[2])
    }
}
