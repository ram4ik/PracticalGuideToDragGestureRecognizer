//
//  example2.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example2: View {
    var body: some View {
        Example2()
    }
}

struct Example2: View {
    @GestureState private var isMoving = false
    @State private var rectPosition = CGPoint(x: 100, y: 100)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Circle()
                    .fill(isMoving ? Color.red : Color.green)
                    .frame(width: 50, height: 50, alignment: .center)
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 100, height: 100, alignment: .center)
                .position(rectPosition)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.rectPosition = value.location
                        })
                        .updating($isMoving, body: { (value, state, transaction) in
                            state = true
                        })
                )
        }
    }
}

struct example2_Previews: PreviewProvider {
    static var previews: some View {
        example2()
    }
}
