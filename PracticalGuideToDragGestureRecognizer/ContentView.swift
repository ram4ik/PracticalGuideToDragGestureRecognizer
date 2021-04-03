//
//  ContentView.swift
//  PracticalGuideToDragGestureRecognizer
//
//  Created by ramil on 03.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            example1().tabItem {Image(systemName: "1.circle")}
            example2().tabItem {Image(systemName: "2.circle")}
            example3().tabItem {Image(systemName: "3.circle")}
            example4().tabItem {Image(systemName: "4.circle")}
            example5().tabItem {Image(systemName: "5.circle")}
            example6().tabItem {Image(systemName: "6.circle")}
            example7().tabItem {Image(systemName: "7.circle")}
            example8().tabItem {Image(systemName: "8.circle")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
