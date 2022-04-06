//
//  CityListView.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import SwiftUI

// This is the view used to display the list.
//This calls the individual row view, add view, and detail view of a city.

struct CityListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredCities: [City] {
                modelData.cities.filter { city in
                (!showFavoritesOnly || city.isFavorite)
            }
        }
    
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    NavigationLink{
                        AddView().environmentObject(modelData)
                    }label: {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .font(.title)
                                .frame(width: 20, height: 20)
                            Text("Add City")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                    }
                    HStack{
                        Spacer()
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                                
                        }
                        Spacer()
                    }
                    
                    
                    List{
                        ForEach(modelData.cities) { city in
                            if showFavoritesOnly{
                                if(city.isFavorite){
                                    NavigationLink {
                                        CityDetailView(city: city)
                                    } label: {
                                        CityRowView(city: city)
                                    }
                                }
                            }
                            else{
                                NavigationLink {
                                    CityDetailView(city: city)
                                } label: {
                                    CityRowView(city: city)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                        .foregroundColor(.blue)
                        
                        
                    }
                }
                .navigationTitle("Cities To Travel To...")
                    .padding()
                
            }
            
        }
        

        
    }
    //discussed in class this is how we delete an item from the list with an IndexSet
    func delete(indexSet: IndexSet){
        modelData.cities.remove(atOffsets: indexSet)
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
            .environmentObject(ModelData())
    }
}



