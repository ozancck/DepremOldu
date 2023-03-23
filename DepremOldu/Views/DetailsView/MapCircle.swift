//
//  MapCircle.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 23.03.2023.
//

import MapKit
import SwiftUI

struct MapCircle: UIViewRepresentable {
    var centerCoordinate: CLLocationCoordinate2D
    var radius: CLLocationDistance

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let circle = MKCircle(center: centerCoordinate, radius: radius)
        mapView.addOverlay(circle)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the view as needed
    }
}
