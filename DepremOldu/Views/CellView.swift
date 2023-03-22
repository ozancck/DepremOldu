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
                        .foregroundColor(Color("redColor"))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(.linearGradient(Gradient(colors: [Color("yellowColor"), Color("redColor")]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(20)
        }
        if (6.0 > Double(magnitude)! && Double(magnitude)! > 2.0){
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
                        .foregroundColor(Color(.green))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Color(.green))
            .cornerRadius(20)
        }
        else{
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
                        .foregroundColor(Color("redColor"))
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Color("redColor"))
            .cornerRadius(20)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(location: "PAYAMBURNU-GOKSUN (KAHRAMANMARAS)", date: "22-22-2222", time: "19:01:29", magnitude: "6.4")
    }
}
