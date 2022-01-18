//
//  NotXcodeApp.swift
//  Shared
//
//  Created by DaBazar on 23.01.21.
//

import SwiftUI
import Decore


let singleCanvas = Canvas.ID(id: "SingleCanvas")

@main
struct NotXcodeApp: App {
    
    var body: some Scene {
        return WindowGroup {
            VStack {
                CanvasView(id: singleCanvas)
            }
        }
    }
}

