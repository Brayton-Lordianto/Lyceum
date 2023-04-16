//
//  PrimaryButtonModel.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

//-- for chaning view
struct PrimaryButton<Content: View>: View {
    var title: String
    var content: () -> Content

    init (title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    var body: some View {
        NavigationLink (
            destination: content(),
            label: {
                Text(title)
                    .font(.system(size: 23, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(15)
                
            })
            //.padding(10)
            .cornerRadius(15)
//            .navigationBarHidden(true)
//            .buttonStyle(.borderedProminent)
//            .buttonBorderShape(.roundedRectangle(radius: 15))
            .background {
                LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
            }
//            .buttonStyle(.borderedProminent)
//            .buttonBorderShape(.roundedRectangle(radius: 15))
            .clipShape(Capsule())
    }
}

struct InaccessibleButton: View {
    var title: String
    init (title: String) {
        self.title = title
    }
    var body: some View {
        
        Text(title)
            .font(.system(size: 23, weight: .bold, design: .default))
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity)
            .padding(15)
        
        
            .cornerRadius(15)
            .background {
                LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
            }
            .clipShape(Capsule())
    }
}
