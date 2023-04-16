//
//  ShopView.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack {
            Text("Shop")
                .font(.system(size: 45, weight: .heavy, design: .default))
                .themeColor()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            Spacer()
                .frame(height: 40)
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Image(systemName: "square.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(
                            LinearGradient(colors: [.yellow, Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
                        )
                        
                        .font(Font.body.weight(.semibold))
                        .padding(.bottom, 10)
                
                    Text("\(tokens)")
                        .themeColor()
                        .font(.system(size: 70, weight: .bold, design: .default))
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                        .onChange(of: tokens) {newValue in
                            tokens = newValue
                        }
                }
                
                
                Spacer()
                    .frame(height: 40)
                   
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(height: 200)
                        .padding(.horizontal, 20)
                        .themeColor()
                        .overlay {
                            VStack {
                                Image(systemName: "cart.badge.plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                                    .font(Font.body.weight(.semibold))
                                    .padding(.bottom, 10)
                                   
                                
                                Text("Get more\nPenguin Tokens")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold, design: .default))
                            }
                        }
                }

                Spacer()
                    .frame(height: 50)
                
                Button(action: {tokens = tokens - 50}) {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(height: 200)
                        .padding(.horizontal, 20)
                        .themeColor()
                        .overlay {
                            
                            VStack {
                                Image(systemName: "text.book.closed")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                                    .font(Font.body.weight(.semibold))
                                    .padding(.bottom, 10)
                                   
                                
                                Text("Purchase Course\nSections")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold, design: .default))
                            }
                        }
                }


                
                Spacer()
            }
            
            

            
        }
        .padding(.horizontal, 40)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
