//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ruaidhrí O'Neill on 15/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Philadelphia, PA")
                
                VStack(spacing: 10) {
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", mainTemperature: isNight ? 32 : 76)
                }
                .padding(.bottom, 40)
                    
                HStack(spacing: 20) {
                    ExtractedView(dayOfWeek: "TUE",
                                  imageName: isNight ? "cloud.fog.fill" : "cloud.sun.fill",
                                  temperature: isNight ? 23 : 74)
                    
                    ExtractedView(dayOfWeek: "WED",
                                  imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
                                  temperature: isNight ? 19 : 70)
                    
                    ExtractedView(dayOfWeek: "THU",
                                  imageName: isNight ? "cloud.moon.rain.fill" : "wind",
                                  temperature: isNight ? 27 :66)
                    
                    ExtractedView(dayOfWeek: "FRI",
                                  imageName: isNight ? "wind.snow" : "sunset.fill",
                                  temperature: isNight ? 11 : 60)
                    
                    ExtractedView(dayOfWeek: "SAT",
                                  imageName: isNight ? "cloud.fill" : "cloud.rain.fill",
                                  temperature: isNight ? 30 : 55)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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

struct ExtractedView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black :
                                                    .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct  CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView : View {
    
    var imageName: String
    var mainTemperature : Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(mainTemperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
}
