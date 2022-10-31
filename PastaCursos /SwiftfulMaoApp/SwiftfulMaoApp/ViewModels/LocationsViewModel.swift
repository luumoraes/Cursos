//
//  LocationsViewModel.swift
//  SwiftfulMaoApp
//
//  Created by Luana Moraes on 25/08/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // todas as localizações carregadas
    @Published var locations: [Location]
    
    // localizacao atual do map
    @Published var mapLocation: Location {
        didSet { // mapa atualiza automaticamente
            updateMapRegion(location: mapLocation)
        }
    }
    // lregiao atual do map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // mostrar a lista de localização
    
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations // json disponível
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
        
    }
    
    func toggleLocationsList() { // toggle = alternar
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}

