//
//  MapView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 23.03.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion
    let annotations: [Location]

    init(latitude: Double, longitude: Double) {
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        ))
        
        self.annotations = [Location(id: 1, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
    }


    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { location in
            MapPin(coordinate: location.coordinate)
        }
    }
}

struct Location: Identifiable {
    let id: Int
    let coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: Double("38.4825")!, longitude: Double("38.3245")!)
    }
}
