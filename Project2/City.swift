//
//  City.swift
//  Project2
//
//  Created by Liam Propst on 3/27/22.
//

import Foundation
import SwiftUI

// The struct that defines what a city is and its attributes

//NOTE: I CANNOT USE CODABLE, this is because I have a picture as an attribute which does not conform to codable due to it not being a standard Swift data type.
struct City: Identifiable {
    var id: Int
    var name: String
    var country: String
    var description: String
    var isFavorite: Bool = false
    var image: Image?
    
    
    private var imageName: String
    
    init(name: String, country: String, desc: String, imageName: String, id: Int, image: Image?)  {
        self.name = name
        self.country = country
        self.description = desc
        self.imageName = imageName
        self.id = id
        
        if self.imageName == ""{
            self.image = image
        }
        else{
            self.image = Image(imageName)
        
        }
        
    }
}
    

//Since I cannot use json because of the picture. This is how we are storing our starting data. This will be an Observable object so it can be monitored by all other views and updated in real time.

class ModelData: ObservableObject {
    @Published var cities: [City] = [City(name: "Big Sur",
                                          country: "California, United States",
                                          desc: "Big Sur is a rugged and mountainous section of the Central Coast of California between Carmel and San Simeon, where the Santa Lucia Mountains rise abruptly from the Pacific Ocean. It is frequently praised for its dramatic scenery.",
                                          imageName: "bigsur",
                                          id: 1,
                                         image: nil),
                                     City(name: "San Fransisco",
                                          country: "California, United States",
                                          desc: "San Francisco, city and port, coextensive with San Francisco county, northern California, U.S., located on a peninsula between the Pacific Ocean and San Francisco Bay. It is a cultural and financial centre of the western United States and one of the country's most cosmopolitan cities.",
                                          imageName: "sanfran",
                                          id: 2,
                                          image: nil),
                                     City(name: "Guanacaste",
                                          country: "Costa Rica",
                                          desc: "Guanacaste (Spanish pronunciation: [ɡwanaˈkaste]) is a province of Costa Rica located in the northwestern region of the country, along the coast of the Pacific Ocean. It is bordered by Nicaragua to the north, Alajuela Province to the east, and Puntarenas Province to the southeast.",
                                          imageName: "costarica",
                                          id: 3,
                                          image: nil),
                                     City(name: "Rome",
                                          country: "Italy",
                                          desc: "Rome (Italian: Roma), the Eternal City, is the capital and largest city of Italy and of the Lazio region. It is famous for being the home of the ancient Roman Empire, the Seven Hills, La Dolce Vita (the sweet life), the Vatican City and Three Coins in the Fountain.",
                                          imageName: "rome",
                                          id: 4,
                                          image: nil)]
}




