//
//  CurriculumVIew.swift
//  Lyceum
//
//  Created by Long Hai on 4/16/23.
//

import Foundation
import SwiftUI

struct CurriculumView<Content: View>: View {
    var title: String
    var content: () -> Content

    init (title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    @ObservedObject var gpt = GPT3ViewModel()
    
    @EnvironmentObject var controlModel: ViewControlModel
    
    @State var syllabus = "loading..."
    @State var doneLoading: Bool = false
    @State var progress: CGFloat = 0
    
    var body: some View {
        ZStack {
            if true {
                VStack {
                    Text(title)
                        .font(.system(size: 35, weight: .heavy, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .themeColor()
                        .padding(.top, 25)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(syllabus)
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        //.padding(.vertical, 25)
                            .padding(.bottom, 30)
                    }
                    
                    Button(action: { controlModel.isShowingGPT = true }) {
                        Text("Ask Penguin")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .themeColor()
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(UIColor(named: "themeColor1")!), lineWidth: 3)
                                
                            )
                    }
                    .padding(.top, 8)
                    
                    NavigationLink (
                        destination: content(),
                        label: {
                            Text("Quiz me")
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                            
                        })
                    .cornerRadius(15)
                    .background {
                        LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
                    }
                    .clipShape(Capsule())
                    
                }
                .padding(.horizontal, 40)
                .fullScreenCover(isPresented: $controlModel.isShowingGPT, onDismiss: {}) {
                    ZStack {
                        GPT3View()
                        
                        VStack {
                            Button(action: {controlModel.isShowingGPT = false}) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.purple)
                                    .font(.system(size: 35))
                                    .font(Font.body.weight(.semibold))
                                    .padding(.leading, 20)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .onAppear {
                    Task {
                        syllabus = await gpt.getDetailedSyllabusAsString(on: title)
                    }
                }
            }
        }
    }
}
