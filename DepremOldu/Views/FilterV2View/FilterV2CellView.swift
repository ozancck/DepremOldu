//
//  FilterV2CellView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 27.03.2023.
//

import SwiftUI

struct FilterV2CellView: View {
    @StateObject var cellViewModel = CellViewModel()

    @State var location: String
    @State var date: String
    @State var magnitude: String

    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text(cellViewModel.splitText(param: location))
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 12)
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 6)

                    Text(magnitude)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("card11"))
                }
            }
            .padding()
        }
        .frame(width: 150, height: 150)
        .background(.linearGradient(Gradient(colors: [Color("card12"), Color("card11")]), startPoint: .trailing, endPoint: .leading))
        .cornerRadius(25)
        
    }
}

struct FilterV2CellView_Previews: PreviewProvider {
    static var previews: some View {
        FilterV2CellView(location: "KAHRAMANMARAS", date: "22-22-2002", magnitude: "9.0").previewLayout(.sizeThatFits)
    }
}
