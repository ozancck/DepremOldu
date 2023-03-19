//
//  EarthquakeModel.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 20.03.2023.
//

import Foundation

struct Earthquake: Codable, Hashable {
    let date, time, latitude, longitude: String
    let depth, md, ml, mw: String
    let location: String
    let revize: String?
}

typealias Quake = [Earthquake]
