//
//  DrinksView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//

import SwiftUI

struct DrinksView: View {
    var volumes = [100, 150, 200, 250, 500, 1000]
    @State var containerVolume = 250
    @State var frequency = 1
    @State var total = 0
    
    var body: some View {
        NavigationView {
            VStack {

//                Image("waterBottle")
//                    .resizable()
//                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.5)
                
//                Picker("Volumes:", selection: $containerVolume) {
//                    ForEach(volumes, id: \.self) {
//                        Text($0)
//                    }
//                }
                
                Button(action: {
                    total += frequency * containerVolume
                }, label: {
                    Image("waterBottle")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.width / 1.2)
                        .cornerRadius(UIScreen.main.bounds.width / 2.4)
                })
                
                Text("Total Consumption: \(total) ml.")
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Container Volume:")
                    .fontWeight(.heavy)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Menu("\(containerVolume) ml") {
                    Picker(selection: $containerVolume, label: Text("VOLUME")) {
                        Text("100 ml").tag(100)
                        Text("150 ml").tag(150)
                        Text("200 ml").tag(200)
                        Text("250 ml").tag(250)
                        Text("500 ml").tag(500)
                        Text("1000 ml").tag(1000)
                    }
                }
                .frame(width: 170, height: 40)
                .background(Color(white: 0.92))
                .cornerRadius(15)
                
                Button(action: {
                    containerVolume = 250
                    frequency = 1
                    total = 0
                }, label: {
                    Text("Reset")
                        .fontWeight(.bold)
                        .frame(width: 120, height: 40)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15.0)
                })
                
            }
            .navigationTitle("Drinks")
        }
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView()
    }
}
