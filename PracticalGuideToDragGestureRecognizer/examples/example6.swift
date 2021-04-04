//
//  example6.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example6: View {
    var body: some View {
        Example6()
    }
}

struct Example6: View {
    @State private var angle: Angle = .zero
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 20, height: 20)
            
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(Color.red)
                .font(.largeTitle)
                .rotationEffect(angle)
                .offset(offset)
                .gesture(
                    DragGesture(minimumDistance: 50, coordinateSpace: .local)
                        .onChanged({ (value) in
                            let translation = value.translation
                            let point1 = Double(translation.width == 0 ? 0 : translation.width)
                            let point2 = Double(translation.height)
                            let a = point1 < 0 ? atan(Double(point2 / point1)) : atan(Double(point2 / point1)) - Double.pi
                            
                            angle = Angle(radians: a)
                            offset = value.translation
                        })
                        .onEnded({ (value) in
                            angle = .zero
                            offset = .zero
                        })
                ).animation(.spring())
        }
    }
}

struct example6_Previews: PreviewProvider {
    static var previews: some View {
        example6()
    }
}
