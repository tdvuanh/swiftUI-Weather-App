//
//  WeatherButton.swift
//  Weather-App
//
//  Created by Trần Duy Vũ Anh on 30/01/2024.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        Text(title).frame(width: 280, height: 50).background(backColor).foregroundColor(textColor).font(.system(size: 20, weight: .bold, design: .default)).cornerRadius(10)
    }
}
