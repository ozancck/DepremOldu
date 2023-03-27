//
//  AllEarthquakeView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 24.03.2023.
//

import SwiftUI

struct AllEarthquakeView: View {
    @StateObject var earthquakesService = EarhtquakesService()
    @State private var searchText = ""
    @State private var fetchCount = 20

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(earthquakesService.earthquakes, id: \.id) { element in

                            if searchText == "" {
                                NavigationLink {
                                    DetailsView(name: element.location, latitude: element.latitude, longitude: element.longitude, magnitude: element.ml, depth: element.depth, date: element.date, time: element.time)
                                } label: {
                                    CellView(location: element.location, date: element.date, time: element.time, magnitude: element.ml)
                                }

                            } else {
                                if element.location.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        DetailsView(name: element.location, latitude: element.latitude, longitude: element.longitude, magnitude: element.ml, depth: element.depth, date: element.date, time: element.time)
                                    } label: {
                                        CellView(location: element.location, date: element.date, time: element.time, magnitude: element.ml)
                                    }
                                }
                            }
                        }
                        ProgressView()
                            .progressViewStyle(.circular)
                            .onAppear {
                                self.fetchCount = self.fetchCount + 20
                                earthquakesService.fetchEarthquakes(param: fetchCount)
                            }
                    }
                }
                .searchable(text: $searchText, prompt: "Ara")

                .navigationBarTitle("Son Depremler")
                .refreshable(action: {
                    earthquakesService.fetchEarthquakes(param: fetchCount)
                })

            }.onAppear {
                earthquakesService.fetchEarthquakes(param: fetchCount)
            }
        }
    }
}

struct AllEarthquakeView_Previews: PreviewProvider {
    static var previews: some View {
        AllEarthquakeView()
    }
}
