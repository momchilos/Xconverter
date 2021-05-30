//
//  XconverterApp.swift
//  Xconverter
//
//  Created by Sem Moolenschot on 5/30/21.
//

import SwiftUI

@main
struct XconverterApp: App {
    @State var delay = 3.0
    @State var loadDone = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if loadDone {
                    LaunchScreen()
                }else{
                    ContentView()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.loadDone = false
                }
            }
            
        }
    }
}
