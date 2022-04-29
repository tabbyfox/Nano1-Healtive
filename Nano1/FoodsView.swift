//
//  FoodsView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//

import SwiftUI

class eatTime: ObservableObject {
    
    @Published var breakfast = Model(index: 0, name: "Breakfast", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
    @Published var lunch = Model(index: 0, name: "Lunch", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
    @Published var dinner = Model(index: 0, name: "Dinner", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
}

struct FoodsView: View {
    
    let foodData = [
        Model(index: 0, name: "Nasi Goreng", imageName: "nasiGoreng", calories: 520, carb: 45, fat: 8, protein: 11),
        Model(index: 1, name: "Bubur Ayam", imageName: "buburAyam", calories: 440, carb: 22, fat: 5, protein: 14),
        Model(index: 2, name: "Ayam Bakar", imageName: "ayamBakar", calories: 515, carb: 48, fat: 7, protein: 27),
        Model(index: 3, name: "Sate Ayam", imageName: "sateAyam", calories: 485, carb: 43, fat: 5, protein: 22),
        Model(index: 4, name: "Mie Ayam", imageName: "mieAyam", calories: 455, carb: 34, fat: 5, protein: 16),
        Model(index: 5, name: "Mie Telor", imageName: "mieTelor", calories: 475, carb: 32, fat: 9, protein: 21),
        Model(index: 6, name: "Rendang", imageName: "rendang", calories: 445, carb: 33, fat: 6, protein: 24),
        Model(index: 7, name: "Nasi Kebuli", imageName: "nasiKebuli", calories: 470, carb: 36, fat: 6, protein: 11),
        Model(index: 8, name: "Dim Sum", imageName: "dimSum", calories: 415, carb: 30, fat: 5, protein: 18),
        Model(index: 9, name: "Ramen", imageName: "ramen", calories: 555, carb: 49, fat: 9, protein: 23),
        Model(index: 10, name: "Nasi Uduk", imageName: "nasiUduk", calories: 465, carb: 38, fat: 5, protein: 8),
        Model(index: 11, name: "Roti Bakar", imageName: "rotiBakar", calories: 365, carb: 32, fat: 4, protein: 12),
        Model(index: 12, name: "Lontong Sayur", imageName: "lontongSayur", calories: 445, carb: 37, fat: 5, protein: 8),
        Model(index: 13, name: "Salad", imageName: "salad", calories: 310, carb: 14, fat: 4, protein: 7),
        Model(index: 14, name: "Burger", imageName: "burger", calories: 490, carb: 31, fat: 14, protein: 19),
        Model(index: 15, name: "Donat", imageName: "donat", calories: 430, carb: 34, fat: 6, protein: 7),
        Model(index: 16, name: "Gimbap", imageName: "gimbap", calories: 425, carb: 30, fat: 4, protein: 13),
        Model(index: 17, name: "Waffle", imageName: "waffle", calories: 445, carb: 35, fat: 5, protein: 9),
        Model(index: 18, name: "Gulai Ikan", imageName: "gulaiIkan", calories: 370, carb: 39, fat: 5, protein: 27),
        Model(index: 19, name: "Gulai Sapi", imageName: "gulaiSapi", calories: 385, carb: 42, fat: 8, protein: 29)
    ]
    
    @State private var showingSheet = false
    @StateObject var calculate = eatTime()
    
    var body: some View {
        NavigationView{
            VStack{
                
                Button(action: {
                    calculate.breakfast = Model(index: 0, name: "Breakfast", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
                    calculate.lunch = Model(index: 0, name: "Lunch", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
                    calculate.dinner = Model(index: 0, name: "Dinner", imageName: "eat", calories: 0, carb: 0, fat: 0, protein: 0)
                }, label: {
                    Image("foodOption")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.5)
                        .background(Color(white: 0.92))
                        .cornerRadius(UIScreen.main.bounds.width / 3)
                })
                
                Text("Please add today's food consumption.")
                    .fontWeight(.heavy)
                    .font(.system(size: 21))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Menu(calculate.breakfast.name) {
                    Picker(selection: $calculate.breakfast, label: Text("VOLUME")) {
                        ForEach(foodData, id: \.self) { item in
                            Text(item.name).tag(foodData[item.index])
                        }
                    }
                }
                .frame(width: 300, height: 40)
                .background(Color(white: 0.92))
                .cornerRadius(15)
                
                Menu(calculate.lunch.name) {
                    Picker(selection: $calculate.lunch, label: Text("VOLUME")) {
                        ForEach(foodData, id: \.self) { item in
                            Text(item.name).tag(foodData[item.index])
                        }
                    }
                }
                .frame(width: 300, height: 40)
                .background(Color(white: 0.92))
                .cornerRadius(15)
                
                Menu(calculate.dinner.name) {
                    Picker(selection: $calculate.dinner, label: Text("VOLUME")) {
                        ForEach(foodData, id: \.self) { item in
                            Text(item.name).tag(foodData[item.index])
                        }
                    }
                }
                .frame(width: 300, height: 40)
                .background(Color(white: 0.92))
                .cornerRadius(15)
                
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Text("Calculate")
                        .fontWeight(.bold)
                        .frame(width: 120, height: 40)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15.0)
                })
                .fullScreenCover(isPresented: $showingSheet) {
                    return CalculateView().environmentObject(self.calculate)
                }
                
            }
            .navigationTitle("Foods")
        }
    }
}

struct CalculateView : View {
    
    @EnvironmentObject var calculate : eatTime
    @Environment(\.dismiss) var dismiss
        
    var body: some View{
        
        let totalCalories = calculate.breakfast.calories + calculate.lunch.calories + calculate.dinner.calories
        let totalCarb = calculate.breakfast.carb + calculate.lunch.carb + calculate.dinner.carb
        let totalFat = calculate.breakfast.fat + calculate.lunch.fat + calculate.dinner.fat
        let totalProtein = calculate.breakfast.protein + calculate.lunch.protein + calculate.dinner.protein

        
        VStack{
            
            ScrollView(.horizontal) {
                HStack {
                    VStack {
                        
                        Text(calculate.breakfast.name)
                            .fontWeight(.heavy)
                        
                        Image(calculate.breakfast.imageName)
                            .resizable()
                            .frame(width: 160, height: 160)
                            .cornerRadius(80)
                        
                        Text("Calories: \(calculate.breakfast.calories) Kcal")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                        HStack {
                            Text("Carb: \(calculate.breakfast.carb) g")
                                .font(.system(size: 12))
                            Text("Fat: \(calculate.breakfast.fat) g")
                                .font(.system(size: 12))
                        }
                        
                        Text("Protein: \(calculate.breakfast.protein) g")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                    }
                    .frame(width: 175, height: 260)
    //                            .background(Color(white: 0.87))
                    .background(Color(white: 0.92))
                    .cornerRadius(15)
                    
                    VStack {
                        
                        Text(calculate.lunch.name)
                            .fontWeight(.heavy)
                        
                        Image(calculate.lunch.imageName)
                            .resizable()
                            .frame(width: 160, height: 160)
                            .cornerRadius(80)
                        
                        Text("Calories: \(calculate.lunch.calories) Kcal")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                        HStack {
                            Text("Carb: \(calculate.lunch.carb) g")
                                .font(.system(size: 12))
                            Text("Fat: \(calculate.lunch.fat) g")
                                .font(.system(size: 12))
                        }
                        
                        Text("Protein: \(calculate.lunch.protein) g")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                    }
                    .frame(width: 175, height: 260)
    //                            .background(Color(white: 0.87))
                    .background(Color(white: 0.92))
                    .cornerRadius(15)
                    
                    VStack {
                        
                        Text(calculate.dinner.name)
                            .fontWeight(.heavy)
                        
                        Image(calculate.dinner.imageName)
                            .resizable()
                            .frame(width: 160, height: 160)
                            .cornerRadius(80)
                        
                        Text("Calories: \(calculate.dinner.calories) Kcal")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                        HStack {
                            Text("Carb: \(calculate.dinner.carb) g")
                                .font(.system(size: 12))
                            Text("Fat: \(calculate.dinner.fat) g")
                                .font(.system(size: 12))
                        }
                        
                        Text("Protein: \(calculate.dinner.protein) g")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        
                    }
                    .frame(width: 175, height: 260)
    //                            .background(Color(white: 0.87))
                    .background(Color(white: 0.92))
                    .cornerRadius(15)
                    
                }
            }
            
            Text("Total Calories:")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("\(totalCalories) Kcal")
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
            HStack{
                
                VStack{
                    
                    Text("Total Carbo:")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("\(totalCarb) gram")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                VStack{
                    
                    Text("Total Fat:")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("\(totalFat) gram")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
            }
            
            Text("Total Protein:")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("\(totalProtein) gram")
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("Press to dismiss")
                    .fontWeight(.bold)
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15.0)
            })
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.white)
        .ignoresSafeArea()
    }
}

struct FoodsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodsView()
    }
}
