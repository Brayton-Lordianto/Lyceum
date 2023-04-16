//
//  Home.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct LearnView: View {
    @State private var topic = ""
    var body: some View {
        VStack {
            Text("Hi, Penguin!")
                .font(.system(size: 45, weight: .heavy, design: .default))
                .themeColor()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            Text("What would you like to learn from ground up?")
                .font(.system(size: 23, weight: .medium, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Anything Here...", text: $topic)
                .padding(.leading)
                .font(.system(size: 23, weight: .medium, design: .default))
                .frame(height: 49)
                .padding(6)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.4), radius: 60, x: 0.0, y: 16)
                .padding(.vertical)
            
            Spacer()
            
            Button(action: {chosenTopic = topic}) {
                PrimaryButton(title: "Generate", content: {SectionView()})
            }
            
            Spacer()
                .frame(height: 50)
            
        }
        .padding(.horizontal, 40)
        
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
