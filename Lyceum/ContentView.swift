//
//  ContentView.swift
//  OpenAI chat-dalle
//
//  Created by kz on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        NavigationView {
//            TabView {
//                GPT3View().tabItem{
//                    Label("CHAT BOT", systemImage: "ellipses.bubble")
//                }
//                DalleView().tabItem{
//                    Label("DALL-E 2", systemImage: "paintbrush")
//                }
//            }
//        }
        Text("he")
            .foregroundStyle(
                LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
            )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

