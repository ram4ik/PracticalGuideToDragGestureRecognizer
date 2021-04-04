//
//  example8.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example8: View {
    var body: some View {
        Example8()
    }
}

struct Example8: View {
    @State private var maxHeight: CGFloat = 200
    @State private var sliderProgress: CGFloat = 0
    @State private var sliderHeight: CGFloat = 0
    @State private var currentSliderValue: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Color.black.opacity(0.3))
            
            Rectangle()
                .fill(Color.white)
                .frame(height: sliderHeight)
        }
        .frame(width: 70, height: maxHeight)
        .cornerRadius(40)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
        .shadow(color: Color.white.opacity(0.2), radius: 5, x: -2, y: -2)
        .gesture(
            DragGesture()
                .onChanged({ (value) in
                    let translation = value.translation
                    sliderHeight = -translation.height + currentSliderValue
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    let progress = sliderHeight / maxHeight
                    sliderProgress = progress <= 1.0 ? progress : 1
                })
                .onEnded({ (value) in
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    currentSliderValue = sliderHeight
                })
        )
        .overlay(
            Image(systemName: (sliderHeight / maxHeight) > 0.5 ? "sun.max.fill" : "sun.min.fill")
                .font(.largeTitle)
                .padding(.bottom, 20)
                .foregroundColor(Color.black.opacity(0.5))
                .animation(.easeIn), alignment: .bottom
        )
    }
}

struct example8_Previews: PreviewProvider {
    static var previews: some View {
        example8()
    }
}
