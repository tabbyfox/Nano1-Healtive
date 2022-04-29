//
//  OnboardingView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        TabView{
            PageView(imageName: "eatFood", title: "Track What You Eat!", subTitle: "Start tracking the content of the food that you eat everyday.", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            PageView(imageName: "drinkWater", title: "Be The Well Heydrated Me!", subTitle: "You can also track how much water you drink.", showDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView : View {
    let imageName: String
    let title: String
    let subTitle: String
    let showDismissButton: Bool
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
//                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.height / 3)
            Text(title)
                .font(Font.custom("Ding Dong", size: 32))
                .fontWeight(.heavy)
//                .font(.system(size: 32))
            Text(subTitle)
                .font(.system(size: 21))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            if showDismissButton {
                Button(action: {
                    shouldShowOnBoarding.toggle()
                }, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .frame(width: 240, height: 40)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(25.0)
                })
                .padding()

            }
        }
    }
}
