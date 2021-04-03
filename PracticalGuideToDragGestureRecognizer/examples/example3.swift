//
//  example3.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example3: View {
    var body: some View {
        Example3()
    }
}

struct Example3: View {
    @State private var rectPosition = CGPoint(x: 100, y: 100)
    @State private var overlapping = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .stroke(overlapping ? Color.red : Color.clear, style: StrokeStyle(lineWidth: overlapping ? 40 : 0))
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.orange, style: StrokeStyle(lineWidth: overlapping ? 2 : 0))
                .background(overlapping ? Color.clear : Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 100, height: 100, alignment: .center)
                .position(rectPosition)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.rectPosition = value.location
                        })
                        .onEnded({ (value) in
                            if value.location.x < UIScreen.main.bounds.minX + 50 || value.location.x > UIScreen.main.bounds.maxX - 50 || value.location.y < UIScreen.main.bounds.minY + 50 || value.location.y > UIScreen.main.bounds.maxY - 50 {
                                self.overlapping = true
                            } else {
                                self.overlapping = false
                            }
                        })
                )
        }
    }
}

struct example3_Previews: PreviewProvider {
    static var previews: some View {
        example3()
    }
}
