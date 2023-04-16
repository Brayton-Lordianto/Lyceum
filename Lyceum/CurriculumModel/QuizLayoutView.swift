//
//  QuizLayoutView.swift
//  Lyceum
//
//  Created by Long Hai on 4/16/23.
//

import SwiftUI

struct QuizLayoutView: View {
    
    let answers = ["<html>", "<head>", "<body>", "<script>"]
    let correct = "<script>"
    @State private var colors = [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor1")!)]
    
    
    @State private var didTap : Bool = false
    @State var selected : String
    
    var body: some View {
        VStack {
            Text("Quiz: HTML")
                .font(.system(size: 35, weight: .heavy, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .themeColor()
                .padding(.top, 25)
            
            Image("preview")
                .resizable()
                .scaledToFit()
            
            Text("Which of the following is NOT a basic HTML tag?")
                .font(.system(size: 18, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            
            
            ForEach(0..<4, id: \.self) { index in
                Button(action: {
                    self.didTap = !self.didTap
                    selected = answers[index]
                    self.colors[index] = Color(.orange)


                }) {
                    Text(answers[index])
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .themeColor()
                        .frame(maxWidth: .infinity)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(colors[index], lineWidth: 3)

                        )
                }
                .padding(.top, 8)
            }
//            Button(action: {
//                self.didTap = !self.didTap
//                selected = answers[0]
//
//
//            }) {
//                Text(answers[0])
//                    .font(.system(size: 18, weight: .bold, design: .default))
//                    .themeColor()
//                    .frame(maxWidth: .infinity)
//                    .padding(15)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(selected==answers[0] ? .orange : Color(UIColor(named: "themeColor1")!), lineWidth: 3)
//
//                    )
//            }
//            .padding(.top, 8)
//
//            Button(action: {
//                self.didTap = !self.didTap
//                selected = answers[1]
//
//
//            }) {
//                Text(answers[1])
//                    .font(.system(size: 18, weight: .bold, design: .default))
//                    .themeColor()
//                    .frame(maxWidth: .infinity)
//                    .padding(15)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(selected==answers[1] ? .orange : Color(UIColor(named: "themeColor1")!), lineWidth: 3)
//
//                    )
//            }
//            .padding(.top, 8)
//
//
//            Button(action: {
//                self.didTap = true
//                selected = answers[2]
//
//
//            }) {
//                Text(answers[2])
//                    .font(.system(size: 18, weight: .bold, design: .default))
//                    .themeColor()
//                    .frame(maxWidth: .infinity)
//                    .padding(15)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(selected==answers[2] ? .orange : Color(UIColor(named: "themeColor1")!), lineWidth: 3)
//
//                    )
//            }
//            .padding(.top, 8)
//
//            Button(action: {
//                self.didTap = !self.didTap
//                selected = answers[3]
//
//
//            }) {
//                Text(answers[3])
//                    .font(.system(size: 18, weight: .bold, design: .default))
//                    .themeColor()
//                    .frame(maxWidth: .infinity)
//                    .padding(15)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(selected==answers[3] ? .orange : Color(UIColor(named: "themeColor1")!), lineWidth: 3)
//
//                    )
//            }
//            .padding(.top, 8)
            
            Spacer()
           
        }
        .padding(.horizontal, 40)
    }
}

struct QuizLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        QuizLayoutView(selected: "")
    }
}
