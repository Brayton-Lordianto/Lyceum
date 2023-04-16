//
//  VersusView.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct VersusView: View {
    var body: some View {
        VStack {
            Text("Versus")
                .font(.system(size: 45, weight: .heavy, design: .default))
                .themeColor()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            
            Spacer()
            
        
            
            
            
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//                .frame(height: 250)
//                .padding(.horizontal, 50)
//                .themeColor()
//                .overlay {
//                    Text("Learn")
//                        .foregroundColor(.white)
//                        .font(.system(size: 30, weight: .bold, design: .default))
//                }
//
//            Spacer()
//                .frame(height: 50)
//
//
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//                .frame(height: 250)
//                .padding(.horizontal, 50)
//                .themeColor()
//                .overlay {
//                    Text("Versus")
//                        .foregroundColor(.white)
//                        .font(.system(size: 30, weight: .bold, design: .default))
//                }
            
        }
        .padding(.horizontal, 40)
    }
}

struct VersusView_Previews: PreviewProvider {
    static var previews: some View {
        VersusView()
    }
}
