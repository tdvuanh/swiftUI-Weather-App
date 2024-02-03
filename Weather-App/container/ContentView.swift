//
//  ContentView.swift
//  Weather-App
//
//  Created by Trần Duy Vũ Anh on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @StateObject private var locationPermission:LocationPermission = LocationPermission()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Your Location")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 35)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 42)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.hail.fill", temperature: 28)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change your day", textColor: .blue, backColor: .white)
                }
                Spacer()
            }
        }.onAppear(perform: {
            locationPermission.requestLocationPermission()
        })
    }

    
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            Text("\(temperature)°C").font(.system(size: 16, weight: .medium, design: .monospaced)).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .purple]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding(.top)
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 180, height: 180)
            Text("\(temperature)°C").font(.system(size: 70, weight: .medium, design: .monospaced)).foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

#Preview {
    ContentView()
}
