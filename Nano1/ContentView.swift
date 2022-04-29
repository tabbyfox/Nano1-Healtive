//
//  ContentView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    /*@AppStorage("_shouldShowOnboarding")*/@State var shouldShowOnboarding: Bool = true
    var body: some View {
        TabView{
            FoodsView()
                .tabItem{
                    Label("Foods", systemImage: "fork.knife")
                }
            DrinksView()
                .tabItem{
                    Label("Drinks", systemImage: "cup.and.saucer.fill")
                }
            InfoView()
                .tabItem{
                    Label("Info", systemImage: "info.circle.fill")
                }
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnBoarding: $shouldShowOnboarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
