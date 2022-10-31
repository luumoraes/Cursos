//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Luana Moraes on 20/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack { // para o background
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("São Paulo, SP")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10) {
                   Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable() // ajustar o tamanho
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180) // ajusta as bordas
                    
                    Text("23º")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TER",
                                   imageName: "sun.max.fill",
                                   temperature: 23)
                    
                    WeatherDayView(dayOfWeek: "QUA",
                                   imageName: "sun.max.fill",
                                   temperature: 21)
                    
                    WeatherDayView(dayOfWeek: "QUI",
                                   imageName: "sunset.fill",
                                   temperature: 20)
                    
                    WeatherDayView(dayOfWeek: "SEX",
                                   imageName: "smoke.fill",
                                   temperature: 18)
                    
                    WeatherDayView(dayOfWeek: "SAB",
                                   imageName: "wind",
                                   temperature: 16)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
