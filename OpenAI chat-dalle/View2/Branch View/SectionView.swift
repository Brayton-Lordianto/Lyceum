//
//  SectionView.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var controlModel: ViewControlModel
    
    let sections = ["HTML", "CSS", "JavaScript", "Responsive Design", "Bootstrap", "jQuery", "Web Accessibility", "Git", "Command Line", "APIs", "AJAX", "Node.js"]
    var body: some View {
        VStack {
            Text(chosenTopic)
                .font(.system(size: 35, weight: .heavy, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .themeColor()
                .padding(.vertical, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(0..<avail) { index in
                    PrimaryButton(title: sections[index], content: {CurriculumView(title: sections[index], content: {QuizView(title: sections[index], content: {SectionView()}, i: 0)})})
                        .padding(.vertical, 3)
                }
                
                ForEach(avail..<sections.count) { index in
                    Button(action: {controlModel.isShowingShop = true}) {
                        InaccessibleButton(title: sections[index])
                            .padding(.vertical, 3)
                    }
                }
            }
            
            
        }
        .padding(.horizontal, 40)
        .fullScreenCover(isPresented: $controlModel.isShowingShop, onDismiss: {}) {
            
            ZStack {
                
                ShopView()
                
                VStack {
                    Button(action: {controlModel.isShowingShop = false}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.purple)
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
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
            .environmentObject(ViewControlModel())
    }
}
