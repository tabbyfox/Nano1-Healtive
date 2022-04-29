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
            PageView(imageName: "eatFood", title: "Placeholder1", subTitle: "loren onaing maifa, asdnfi, yaoufha, ajiesnafm ,sf aienus, hanati, fnai, fniiefa, fsnienk, disfienlm, malifank, nfsienf.", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            PageView(imageName: "drinkWater", title: "Placeholder2", subTitle: "Miyafnk, jidf, fnseif, snfial, faidasf, snafs, fmaidnfa, asdnfia, naidfa, nfaio,fnasnfi, anisfda, fnaisdf, fanisdf, nsf.", showDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding)
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
                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.minY)
//                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width, height: 60)
            Text(subTitle)
                .font(.system(size: 21))
                .fontWeight(.medium)
                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.minY)
            
            if showDismissButton {
                Button(action: {
                    shouldShowOnBoarding.toggle()
                }, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .frame(width: 300, height: 60)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(25.0)
                })
                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.minY)
            }
        }
    }
}
