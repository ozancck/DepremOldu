//
//  TabView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 22.03.2023.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            AllEarthquakeView()
                .tabItem {
                    Label("Tüm Depremler", systemImage: "waveform.path.ecg.rectangle.fill")
                }

            FilterEarthquakeView()
                .tabItem {
                    Label("Büyük Depremler", systemImage: "alarm.waves.left.and.right.fill")
                }
        }
        .tableStyle(.inset)
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
