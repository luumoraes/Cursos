//
//  Location.swift
//  SwiftfulMaoApp
//
//  Created by Luana Moraes on 24/08/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
   
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable --> para terem o mesmo id
    var id: String { // string aleatória --> id na struct do Identifiable (p terem o mesmo id)
        name + cityName
    }
    
//    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}

