//
//  FilterEarthquakeView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 24.03.2023.
//

import SwiftUI

struct FilterEarthquakeView: View {
    @StateObject var earthquakesService = EarhtquakesService()

    @State private var selectedMagnitude = 0
    let magnitudes = ["3", "4", "5", "6", "7"]

    var body: some View {
        NavigationStack {
            Picker("Siddet", selection: $selectedMagnitude) {
                ForEach(0 ..< magnitudes.count) { index in
                    Text(self.magnitudes[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)

            VStack {
                ScrollView {
                    VStack {
                        ForEach(earthquakesService.earthquakes, id: \.id) { element in
                            if Double(element.ml)! > Double(magnitudes[selectedMagnitude])! {
                                NavigationLink {
                                    DetailsView(name: element.location, latitude: element.latitude, longitude: element.longitude, magnitude: element.ml, depth: element.depth, date: element.date, time: element.time)
                                } label: {
                                    CellView(location: element.location, date: element.date, time: element.time, magnitude: element.ml)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Büyük Depremler")
                .refreshable(action: {
                    earthquakesService.fetchEarthquakes(param: 500)
                })
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)

            }.onAppear {
                earthquakesService.fetchEarthquakes(param: 500)
            }
        }
    }
}

struct FilterEarthquakeView_Previews: PreviewProvider {
    static var previews: some View {
        FilterEarthquakeView()
    }
}
