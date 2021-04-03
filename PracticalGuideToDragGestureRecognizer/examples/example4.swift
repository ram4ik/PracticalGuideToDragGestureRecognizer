//
//  example4.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example4: View {
    var body: some View {
        Example4()
    }
}

struct Example4: View {
    @State private var sliderPosition: CGFloat = 50 - UIScreen.main.bounds.width
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        GeometryReader { geoProxy in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .rotationEffect(.degrees(90))
                }
                .foregroundColor(.white)
                .frame(height: 100)
                .padding()
                .background(
                    ZStack {
                        Rectangle()
                            .fill(Color.orange)
                            .offset(x: -100)
                        
                        Capsule()
                            .fill(Color.orange)
                    }
                )
                .offset(x: sliderPosition + offset.width - 10)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { (value, state, transaction) in
                            state = value.translation
                        })
                        .onEnded({ (value) in
                            if value.translation.width < -geoProxy.size.width * 0.4 {
                                sliderPosition = 50 - geoProxy.size.width
                            } else {
                                sliderPosition = 0
                            }
                        })
                ).animation(.spring())
                
                Spacer()
            }
        }
    }
}

struct example4_Previews: PreviewProvider {
    static var previews: some View {
        example4()
    }
}
