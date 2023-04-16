//
//  QuizLayoutView.swift
//  Lyceum
//
//  Created by Long Hai on 4/16/23.
//

import SwiftUI

struct QuizLayoutView: View {
    
    
    let correct = "<script>"
    
    // @State private var colors = [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!)]
    
    func gradeToContent(letter: String) -> Int {
        if letter == "A" {
            return 0
        }
        else if letter == "B" {
            return 1
        }
        else if letter == "C" {
            return 2
        }
        else {
            return 3
        }
    }
    
    
    @State private var didTap : Bool = false
    
    @State private var didCheck : Bool = false
    @State var selected : String
    var nowQuiz = myQuiz.questions[0]
    
    @State var answers = [myQuiz.questions[0].A, myQuiz.questions[0].B, myQuiz.questions[0].C, myQuiz.questions[0].D]
    
    var body: some View {
        
        VStack {
            Text("Quiz: \(chosenSection)")
                .font(.system(size: 35, weight: .heavy, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .themeColor()
                .padding(.top, 25)
            
            Image("preview")
                .resizable()
                .scaledToFit()
            
            Text("\(nowQuiz.question)")
                .font(.system(size: 18, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            if didCheck == false {
                ForEach(0..<4, id: \.self) { index in
                    Button(action: {
                        self.didTap = !self.didTap
                        selected = answers[index]
                    }) {
                        if selected == answers[index] {
                            Text(answers[index])
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                            
                            
                                .cornerRadius(15)
                                .background {
                                    LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
                                }
                                .clipShape(Capsule())
                        }
                        else {
                            Text(answers[index])
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .themeColor()
                                .frame(maxWidth: .infinity)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(UIColor(named: "themeColor1")!), lineWidth: 3)
                                    
                                )
                        }
                        
                    }
                    .padding(.top, 8)
                    
                }
                
                Spacer()
                
                Button(action: {didCheck = true}) {
                    Text("Check")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(15)
                    
                    
                        .cornerRadius(15)
                        .background {
                            LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
                        }
                        .clipShape(Capsule())
                }
            }
            
            //--after checking
            else {
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer().frame(height: 7)
                    ForEach(0..<4, id: \.self) { index in
                        
//                        if selected == answers[index] {
//                            Text(answers[index])
//                                .font(.system(size: 18, weight: .bold, design: .default))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                                .padding(15)
//
//
//
//                                .cornerRadius(15)
//                                .background {
//                                    LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
//                                }
//                                .clipShape(Capsule())
//                        }
                        
                        if answers[gradeToContent(letter: nowQuiz.answer)] == selected {
                            Text(answers[gradeToContent(letter: nowQuiz.answer)])
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                            
                            
                                .cornerRadius(15)
                                .background {
                                    LinearGradient(colors: [.green, Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
                                }
                                .clipShape(Capsule())
                        }
                        else {
                            Text(answers[index])
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .themeColor()
                                .frame(maxWidth: .infinity)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(UIColor(named: "themeColor1")!), lineWidth: 3)
                                )
                        }
                        
                    }
                    
                }
            }
            
            
            
        }
        
        .padding(.horizontal, 40)
        .onAppear {
            answers = [nowQuiz.A, nowQuiz.B, nowQuiz.C, nowQuiz.D]
        }
    }
}

struct QuizLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        QuizLayoutView(selected: "")
    }
}
