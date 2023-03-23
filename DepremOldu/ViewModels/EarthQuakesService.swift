//
//  EarthQuakesService.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 20.03.2023.
//

import Alamofire
import Foundation
import SwiftUI

class EarhtquakesService: ObservableObject {
    @Published var earthquakes = [Earthquake]()
    
    init(){
        fetchEarthquakes()
    }

    func fetchEarthquakes() {
        AF.request("https://www.mertsenturk.net/deprem/api/limit/500", method: .get).responseDecodable(of:Quake.self) { response in
            switch response.result {
            case let .success(data):
                self.earthquakes = data

            case let .failure(error):
                print(error)
            }
        }
    }
}
