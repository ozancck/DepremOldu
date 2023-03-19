//
//  HomeView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 20.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var earthquakesService = EarhtquakesService()

    var body: some View {
        VStack {
            ForEach(earthquakesService.earthquakes, id: \.self) { element in
                if Double(element.ml)! > 3.5 {
                    Text(element.date)
                }
                
            }
        }.onAppear {
            earthquakesService.fetchEarthquakes()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
