//
//  ElementModifier.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import SwiftUI

struct mainColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(colors: [Color(UIColor(named: "themeColor1")!), Color(UIColor(named: "themeColor2")!)], startPoint: .bottom, endPoint: .top)
            )
    }
}

extension View {
    func themeColor() -> some View {
        modifier(mainColor())
    }
}
