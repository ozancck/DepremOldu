//
//  DetailsView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 23.03.2023.
//

import MapKit
import SwiftUI

struct DetailsView: View {
    @StateObject var cellViewModel = CellViewModel()
    @State var name: String
    @State var latitude: String
    @State var longitude: String
    @State var magnitude: String
    @State var depth: String
    @State var date: String
    @State var time: String
    var body: some View {
        NavigationStack {
            VStack {
                MapView(latitude: Double(latitude)!, longitude: Double(longitude)!)
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.5)
                    .cornerRadius(35)

                VStack {
                    Text(cellViewModel.splitText(param: name))
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                }
                .frame(width: UIScreen.main.bounds.width * 0.95)
                .background(Color(.black).opacity(0.8))
                .cornerRadius(14)

                HStack {
                    VStack {
                        HStack {
                            Text("Tarih:")
                                .foregroundColor(.white)
                                .font(.caption)

                            Text("\(date)")
                                .foregroundColor(.white)
                                .font(.caption)
                                .italic()
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)

                        HStack {
                            Text("Saat:")
                                .foregroundColor(.white)
                                .font(.caption)

                            Text("\(time)")
                                .foregroundColor(.white)
                                .font(.caption)
                                .italic()
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Derinlik:")
                                .foregroundColor(.white)
                                .font(.caption)

                            Text("\(depth)KM")
                                .foregroundColor(.white)
                                .italic()
                                .font(.caption)
                                .bold()

                            Spacer()
                        }

                        .padding(.horizontal)
                        .padding(.bottom)
                    }

                    ZStack {
                        Circle()
                            .frame(height: UIScreen.main.bounds.height * 0.13)
                            .foregroundColor(.white)

                        Text(magnitude)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(Color("card11"))
                    }
                    .padding()
                }
                .background(Color(.black).opacity(0.8))

                .frame(width: UIScreen.main.bounds.width * 0.95)
                .cornerRadius(14)

                Spacer()
            }

            .padding(.bottom, 75)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(name: "KAHRAMANMARAS", latitude: "38.485", longitude: "38.825", magnitude: "5.7", depth: "33", date: "22-33-2222", time: "12:22")
    }
}
