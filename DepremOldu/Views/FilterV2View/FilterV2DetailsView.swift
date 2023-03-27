//
//  FilterV2DetailsView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 27.03.2023.
//

import SwiftUI

struct FilterV2DetailsView: View {
    
    
    @StateObject var cellViewModel = CellViewModel()
    @State var location: String
    @State var date: String
    @State var magnitude: String
    @State var time: String
    @State var ml: String
    @State var md: String
    @State var mw: String
    @State var longitude: String
    @State var latitude: String
    @State var depth: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(cellViewModel.splitText(param: location))
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.top)

            HStack {
                VStack(alignment: .leading) {
                    Text("Date: \(date)")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.black)

                    Text("Time: \(time)")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.black)

                    Text("Depth: \(depth)")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.black)

                    VStack(alignment: .leading) {
                        Text("ml: \(ml)")
                            .font(.callout)
                            .padding(.top)
                            .bold()
                        Text("md: \(md)")
                            .font(.callout)

                            .bold()
                        Text("mw: \(mw)")
                            .font(.callout)
                            .padding(.bottom)
                            .bold()
                    }
                    .frame(width: 150)
                    .background(Color("detail1"))
                    .cornerRadius(15)
                }

                MapView(latitude: Double(latitude)!, longitude: Double(longitude)!)

                    .frame(width: 150, height: 160)
                    
                    .cornerRadius(15)
                
            }
            .padding(.bottom)

            .padding(.horizontal, 10)
        }
        .background(.white)
        .cornerRadius(26)
    }
}

struct FilterV2DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterV2DetailsView(location: "Adana", date: "22-22-2022", magnitude: "7.6", time: "12:22", ml: "3.3", md: "0.0", mw: "0.0", longitude: "38.4825", latitude: "38.4825", depth: "22").previewLayout(.sizeThatFits)
    }
}
