//
//  swiftui_demoApp.swift
//  swiftui_demo
//
//  Created by ChengHao on 2022/2/28.
//

import SwiftUI

@main
struct swiftui_demoApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
