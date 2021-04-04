//
//  example5.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example5: View {
    var body: some View {
        Example5()
    }
}

struct Example5: View {
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.orange, lineWidth: 1)
                .frame(width: 100, height: 100, alignment: .center)
            
            Image(systemName: "arrow.right.circle")
                .font(.largeTitle)
                .foregroundColor(.orange)
        }.offset(offset)
        .gesture(
            DragGesture(minimumDistance: 100)
                .updating($offset, body: { (value, state, _) in
                    state = value.translation
                })
        ).animation(.spring())
    }
}

struct example5_Previews: PreviewProvider {
    static var previews: some View {
        example5()
    }
}
