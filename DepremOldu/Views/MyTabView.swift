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
            HomeView()
                .tabItem {
                    Label("Tüm Depremler", systemImage: "waveform.path.ecg.rectangle.fill")
                }
                

            RedOneView()
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
