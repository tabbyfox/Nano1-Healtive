//
//  InfoView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//
import Foundation
import SwiftUI

struct InfoView: View {
    
    let foodData = [
        Model(index: 0, name: "Nasi Goreng", imageName: "nasiGoreng", calories: 420, carb: 45, fat: 8, protein: 11),
        Model(index: 1, name: "Bubur Ayam", imageName: "buburAyam", calories: 340, carb: 22, fat: 5, protein: 14),
        Model(index: 2, name: "Ayam Bakar", imageName: "ayamBakar", calories: 415, carb: 48, fat: 7, protein: 27),
        Model(index: 3, name: "Sate Ayam", imageName: "sateAyam", calories: 385, carb: 43, fat: 5, protein: 22),
        Model(index: 4, name: "Mie Ayam", imageName: "mieAyam", calories: 355, carb: 34, fat: 5, protein: 16),
        Model(index: 5, name: "Mie Telor", imageName: "mieTelor", calories: 375, carb: 32, fat: 9, protein: 21),
        Model(index: 6, name: "Rendang", imageName: "rendang", calories: 345, carb: 33, fat: 6, protein: 24),
        Model(index: 7, name: "Nasi Kebuli", imageName: "nasiKebuli", calories: 370, carb: 36, fat: 6, protein: 11),
        Model(index: 8, name: "Dim Sum", imageName: "dimSum", calories: 315, carb: 30, fat: 5, protein: 18),
        Model(index: 9, name: "Ramen", imageName: "ramen", calories: 455, carb: 49, fat: 9, protein: 23),
        Model(index: 10, name: "Nasi Uduk", imageName: "nasiUduk", calories: 365, carb: 38, fat: 5, protein: 8),
        Model(index: 11, name: "Roti Bakar", imageName: "rotiBakar", calories: 290, carb: 32, fat: 4, protein: 12),
        Model(index: 12, name: "Lontong Sayur", imageName: "lontongSayur", calories: 345, carb: 37, fat: 5, protein: 8),
        Model(index: 13, name: "Salad", imageName: "salad", calories: 210, carb: 14, fat: 14, protein: 7),
        Model(index: 14, name: "Burger", imageName: "burger", calories: 390, carb: 31, fat: 31, protein: 19),
        Model(index: 15, name: "Donat", imageName: "donat", calories: 330, carb: 34, fat: 6, protein: 7),
        Model(index: 16, name: "Gimbap", imageName: "gimbap", calories: 325, carb: 30, fat: 4, protein: 13),
        Model(index: 17, name: "Waffle", imageName: "waffle", calories: 345, carb: 35, fat: 5, protein: 9),
        Model(index: 18, name: "Gulai Ikan", imageName: "gulaiIkan", calories: 370, carb: 39, fat: 5, protein: 27),
        Model(index: 19, name: "Gulai Sapi", imageName: "gulaiSapi", calories: 385, carb: 42, fat: 8, protein: 29)
    ]

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 8) {
                    ForEach(foodData, id: \.self) { item in
                        VStack {
                            VStack {
                                
                                Text(item.name)
                                    .fontWeight(.heavy)
                                
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 160, height: 160)
                                    .cornerRadius(80)
                                
                                Text("Calories: \(item.calories) Kcal")
                                    .font(.system(size: 12))
                                    .fontWeight(.heavy)
                                
                                HStack {
                                    Text("Carb: \(item.carb) g")
                                        .font(.system(size: 12))
                                    Text("Fat: \(item.fat) g")
                                        .font(.system(size: 12))
                                }
                                
                                Text("Protein: \(item.protein) g")
                                    .font(.system(size: 12))
                                    .fontWeight(.heavy)
                                
                            }
                            .frame(width: 175, height: 260)
//                            .background(Color(white: 0.87))
                            .background(Color(white: 0.92))
                            .cornerRadius(15)
                            

                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Info")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct Model: Hashable {
    let index : Int
    let name: String
    let imageName: String
    let calories: Int
    let carb: Int
    let fat: Int
    let protein : Int
}
