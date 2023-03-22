//
//  RedOneVıew.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 22.03.2023.
//

import SwiftUI

struct RedOneView: View {
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
                List(earthquakesService.earthquakes, id: \.self) { element in
                    if Double(element.ml)! > Double(magnitudes[selectedMagnitude])! {
                        CellView(location: element.location, date: element.date, time: element.time, magnitude: element.ml)
                    }

                }.listStyle(.inset)
                    .refreshable {
                        earthquakesService.fetchEarthquakes()
                    }
                    .navigationTitle("Son Depremler")

            }.onAppear {
                earthquakesService.fetchEarthquakes()
            }
        }
    }
}

struct RedOneV_ew_Previews: PreviewProvider {
    static var previews: some View {
        RedOneView()
    }
}
