//
//  example1.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example1: View {
    var body: some View {
        Example1()
    }
}

struct Example1: View {
    @State private var rectPosition = CGPoint(x: 100, y: 100)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .position(rectPosition)
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        self.rectPosition = value.location
                    })
            )
    }
}

struct example1_Previews: PreviewProvider {
    static var previews: some View {
        example1()
    }
}
