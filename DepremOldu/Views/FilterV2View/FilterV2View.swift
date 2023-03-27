//
//  FilterV2View.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 27.03.2023.
//

import SwiftUI

struct FilterV2View: View {
    @StateObject var earthquakesService = EarhtquakesService()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Bazı Depremler")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .bold()

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(earthquakesService.earthquakes, id: \.id) { element in

                            if Double(element.ml) ?? 0.0 >= 3.0 {
                                FilterV2CellView(location: element.location, date: element.date, magnitude: element.ml)
                            }
                        }
                    }.padding(.horizontal)
                }
                .frame(height: UIScreen.main.bounds.height * 0.18)

                Text("Konmlar")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(.white)

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(earthquakesService.earthquakes, id: \.id) { element in
                            if Double(element.ml) ?? 0.0 >= 3.0 {
                                MapView(latitude: Double(element.latitude)!, longitude: Double(element.longitude)!)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(25)
                                    .shadow(radius: 5)
                            }
                        }
                    }

                    .frame(height: UIScreen.main.bounds.height * 0.18)
                    .padding(.horizontal)
                }

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(earthquakesService.earthquakes, id: \.id) { element in
                            
                            FilterV2DetailsView(location: element.location, date: element.date, magnitude: element.ml, time: element.time, ml: element.ml, md: element.md, mw: element.mw, longitude: element.longitude, latitude: element.latitude, depth: element.depth)
                            
                            
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .background(.black)

        }.onAppear {
            earthquakesService.fetchEarthquakes(param: 500)
        }
    }
}

struct FilterV2View_Previews: PreviewProvider {
    static var previews: some View {
        FilterV2View()
    }
}
