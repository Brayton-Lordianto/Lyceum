//
//  Home.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI


struct LearnView: View {
    @State private var topic = ""
    @State var doneLoading: Bool = false
    @State var progress: CGFloat = 0
    @StateObject var gpt3 = GPT3ViewModel()

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
                PrimaryButton(title: "Generate", content: {
                    // MARK: generate sections using topic and feed it into SectionView
                    if !doneLoading {
                        LoadingView(progress: $progress)
                            .onAppear {
                                Task {
                                    await gpt3.getSections(on:topic)
                                }
                                chosenTopic = topic
                            }
                    } else {
                        SectionView(sections: gpt3.sections)
                    }
                })
            }
            
            Spacer()
                .frame(height: 50)
            
        }
        .padding(.horizontal, 40)
        .onChange(of: gpt3.sections) { newValue in
            self.progress = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation {
                    self.doneLoading = true
                }
            }
        }

    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}

/*
 
 */
