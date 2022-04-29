//
//  FoodsView.swift
//  Nano1
//
//  Created by Suherda Dwi Santoso on 27/04/22.
//

import SwiftUI

struct FoodsView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Image("foodOption")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                
                Text("Please add today's food consumtion.")
                    .fontWeight(.heavy)
                    .font(.system(size: 21))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            }
            .navigationTitle("Foods")
        }
    }
}

struct FoodsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodsView()
    }
}
