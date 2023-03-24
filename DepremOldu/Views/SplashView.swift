//
//  SplahView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 24.03.2023.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("deprem")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 1.3)
            }.ignoresSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
        }
    }
}

struct SplahView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
