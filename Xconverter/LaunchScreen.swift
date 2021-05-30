//
//  ContentView.swift
//  Tiare
//
//  Created by Alex Prezioso on 14/04/21.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack() {
                    Image("splash")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.0)
                }
            }
            .frame(minWidth: geometry.size.width, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
