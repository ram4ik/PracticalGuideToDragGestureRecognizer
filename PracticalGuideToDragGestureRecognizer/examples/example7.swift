//
//  example7.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct example7: View {
    var body: some View {
        Example7()
    }
}

struct Example7: View {
    @State private var minValue: Float = 0.0
    @State private var maxValue: Float = Float(UIScreen.main.bounds.width - 50.0)
    
    var body: some View {
        VStack {
            Text("Range Slider")
            
            DTRangeSlider(
                minValue: $minValue,
                maxValue: $maxValue,
                sliderWidth: CGFloat(maxValue),
                globeMinMaxValuesColor: .black)
        }
    }
}

struct DTRangeSlider: View {
    @Binding var minValue: Float
    @Binding var maxValue: Float
    
    @State var sliderWidth: CGFloat = 0.0
    @State var backgroundTrackColor = Color.green.opacity(0.3)
    @State var selectedTrackColor = Color.orange
    
    @State var globeColor = Color.gray
    @State var globeBackgroundColor = Color.black
    
    @State var globeMinMaxValuesColor = Color.black
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                    .offset(x: 28, y: 20)
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(globeMinMaxValuesColor)
                Spacer()
                Text("100")
                    .offset(x: -18, y: 20)
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .foregroundColor(globeMinMaxValuesColor)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule()
                    .fill(backgroundTrackColor)
                    .frame(width: CGFloat(sliderWidth + 10), height: 20)
                
                Capsule()
                    .fill(selectedTrackColor)
                    .offset(x: CGFloat(minValue))
                    .frame(width: CGFloat((maxValue) - minValue), height: 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(globeColor)
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(globeBackgroundColor, lineWidth: 2))
                        .offset(x: CGFloat(minValue))
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x > 8 && value.location.x <= self.sliderWidth && value.location.x < CGFloat(maxValue - 30) {
                                        minValue = Float(value.location.x - 8)
                                    }
                                })
                        )
                    
                    Text(String(format: "%.0f", (CGFloat(minValue) / sliderWidth) * 100))
                        .offset(x: CGFloat(minValue))
                        .multilineTextAlignment(.center)
                        .frame(width: 30, height: 30)
                        .foregroundColor(globeMinMaxValuesColor)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(globeColor)
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(globeBackgroundColor, lineWidth: 2))
                        .offset(x: CGFloat(maxValue - 18))
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x - 8 <= sliderWidth && value.location.x > CGFloat(minValue + 40) {
                                        maxValue = Float(value.location.x - 8)
                                    }
                                })
                        )
                    
                }
                Text(String(format: "%.0f", (CGFloat(maxValue) / sliderWidth) * 100))
                    .offset(x: CGFloat(maxValue - 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 30, height: 30)
                    .foregroundColor(globeMinMaxValuesColor)
            }
        }
    }
}

struct example7_Previews: PreviewProvider {
    static var previews: some View {
        example7()
    }
}
