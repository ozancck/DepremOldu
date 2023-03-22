//
//  CellView.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 21.03.2023.
//

import SwiftUI

struct CellView: View {
    @StateObject var cellViewModel = CellViewModel()

    @State var location: String
    @State var date: String
    @State var time: String
    @State var magnitude: String

    var body: some View {
        if Double(magnitude)! > 6.0 {
            HStack {
                VStack(alignment: .center) {
                    Text(cellViewModel.splitText(param: location))
                        .bold()
                        .font(.title3)
                    Text(date)
                        .italic()
                    Text(time)
                        .font(.title2)
                        .bold()
                        .italic()
                        .foregroundColor(.black)
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .padding(.leading)
                .foregroundColor(.white)

                Spacer()

                ZStack {
                    Circle()
                        .frame(height: UIScreen.main.bounds.height * 0.11)
                        .foregroundColor(.white)

                    Text(magnitude)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color("card11"))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
            .background(.linearGradient(Gradient(colors: [Color("card12"), Color("card11")]), startPoint: .trailing, endPoint: .leading))
           
            .cornerRadius(20)
            .shadow(radius: 2)
        }
        if 6.0 > Double(magnitude)! && Double(magnitude)! > 2.0 {
            HStack {
                VStack(alignment: .center) {
                    Text(cellViewModel.splitText(param: location))
                        .bold()
                        .font(.title3)
                    Text(date)
                        .italic()
                    Text(time)
                        .font(.title2)
                        .bold()
                        .italic()
                        .foregroundColor(.black)
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .padding(.leading)
                .foregroundColor(.white)

                Spacer()

                ZStack {
                    Circle()
                        .frame(height: UIScreen.main.bounds.height * 0.11)
                        .foregroundColor(.white)

                    Text(magnitude)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color("card22"))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
            .background(.linearGradient(Gradient(colors: [Color("card21"), Color("card22")]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(20)
            .shadow(radius: 2)
        } else {
            HStack {
                VStack(alignment: .center) {
                    Text(cellViewModel.splitText(param: location))
                        .bold()
                        .font(.title3)
                    Text(date)
                        .italic()
                    Text(time)
                        .font(.title2)
                        .bold()
                        .italic()
                        .foregroundColor(.black)
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .padding(.leading)
                .foregroundColor(.white)

                Spacer()

                ZStack {
                    Circle()
                        .frame(height: UIScreen.main.bounds.height * 0.11)
                        .foregroundColor(.white)

                    Text(magnitude)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color("card32"))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
            .background(.linearGradient(Gradient(colors: [Color("card32"), Color("card31")]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(20)
            .shadow(radius: 2)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(location: "PAYAMBURNU-GOKSUN (KAHRAMANMARAS)", date: "22-22-2222", time: "19:01:29", magnitude: "6.4").previewLayout(.sizeThatFits)
    }
}
