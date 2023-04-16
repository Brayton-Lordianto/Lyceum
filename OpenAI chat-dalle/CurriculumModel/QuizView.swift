//
//  QuizView.swift
//  Lyceum
//
//  Created by Long Hai on 4/16/23.
//

import SwiftUI

struct QuizView<Content: View>: View {
    var title: String
    var i : Int
    var content: () -> Content

    init (title: String, @ViewBuilder content: @escaping () -> Content, i: Int) {
        self.title = title
        self.content = content
        self.i = i
    }
    
    @ObservedObject var gpt = GPT3ViewModel()
    
    @EnvironmentObject var controlModel: ViewControlModel
    
    @State var doneLoading: Bool = false
    @State var progress: CGFloat = 0
    
    var body: some View {
        ZStack {
            if doneLoading {
                VStack {
                    Text("Quiz: " + title)
                        .font(.system(size: 35, weight: .heavy, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .themeColor()
                        .padding(.top, 25)
                    
                    Text(myQuiz.questions[i].question)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                        //.padding(.bottom, 30)
                    
                    
                    
                    
//                    ScrollView(.vertical, showsIndicators: false) {
//                        Text(syllabus)
//                            .font(.system(size: 15, weight: .regular, design: .default))
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            //.padding(.vertical, 25)
//                            .padding(.bottom, 30)
//                    }
                    
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
            }
            else {
                LoadingView(progress: $progress)
            }
        }
//        .onChange(of: myQuiz) { newValue in
//
//            self.progress = 0
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//                withAnimation {
//                    self.doneLoading = true
//                }
//            }
//        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                withAnimation {
                    self.doneLoading = true
                    self.progress = 0
                }
            }
        }
        
        
        
    }
}
