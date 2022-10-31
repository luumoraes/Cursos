//
//  LocationsView.swift
//  SwiftfulMaoApp
//
//  Created by Luana Moraes on 25/08/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
//    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), // localização central no mapa
//        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)) // zoom no mapa (esse 0.1 é bastante ampliado)

    var body: some View {
        ZStack { // empilhar - z: profundidade
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding() // "borda"
                
                Spacer()
                
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView { // para organizacao e nao deixar a view sobrecarregada
    
    private var header: some View {
        VStack { // MENU
            Button(action: vm.toggleLocationsList) { // mostra a lista locais
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down") // setinha
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding() // arruma posição da imagem
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0)) // animacao da seta 
                    }
            }
            
            if vm.showLocationsList { // se for verdade mostra a lista
                LocationsListView()
            }
        }
        .background(.thickMaterial) // linha espessa na tabbar
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        
    }
}
