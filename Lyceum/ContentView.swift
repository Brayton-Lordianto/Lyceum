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
        
        NavigationView {
            TabView {
                LearnView().tabItem {
                    Label("Learn", systemImage: "ellipses.bubble")
                       
                }
                VersusView().tabItem {
                    Label("Versus", systemImage: "paintbrush")
                       
                }
                ShopView().tabItem {
                    Label("Shop", systemImage: "cart.fill")
                       
                }
            }
            .accentColor(Color(UIColor(named: "themeColor1")!))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

