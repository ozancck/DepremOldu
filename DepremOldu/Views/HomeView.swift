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
            ScrollView {
                ForEach(earthquakesService.earthquakes, id: \.self) { element in

                    CellView(location: element.location, date: element.date, time: element.time, magnitude: element.ml)
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
