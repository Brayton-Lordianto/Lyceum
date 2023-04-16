//
//  Home.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(height: 250)
                .padding(.horizontal, 50)
                //.padding(.bottom, 30)
                .themeColor()
                .overlay {
                    Text("Learn")
                        .foregroundColor(.white)
                        .font(Font.custom("Ja-Bold", size: 30))
                }
            
            Spacer()
                .frame(height: 50)
            
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(height: 250)
                .padding(.horizontal, 50)
                .themeColor()
                .overlay {
                    Text("Versus")
                        .foregroundColor(.white)
                        .font(.custom("PlusJakartaSans-ExtraBold", size: 30))
                }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
