//
//  LoadingView.swift
//  Lyceum
//
//  Created by Long Hai on 4/16/23.
//

import SwiftUI

struct LoadingView: View {
    @Binding var progress: CGFloat
    @State var logOffset: CGFloat = 0
    
    var body: some View {
        Image("loading")
            .modifier(ScaledMaskModifier(mask: RoundedRectangle(cornerRadius: 10), progress: progress))
            .offset(x: 0, y: logOffset)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1)) {
                    self.progress = 1.0
                }
                withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
                    self.logOffset = 10
                }
                
            }
    }
}

struct ScaledMaskModifier<Mask: View>: ViewModifier {
    var mask: Mask
    var progress: CGFloat
    
    func body(content: Content) -> some View {
        content
            .mask(GeometryReader(content: { geo in
                self.mask.frame(width: self.calculateSize(geo: geo) * self.progress,
                                height: self.calculateSize(geo: geo) * self.progress,
                                alignment: .center)
            }))
    }
    
    func calculateSize(geo: GeometryProxy) -> CGFloat {
        if geo.size.width > geo.size.height {
            return geo.size.width
        }
        return geo.size.height
    }
}



//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView()
//    }
//}
