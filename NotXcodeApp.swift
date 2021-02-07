//
//  NotXcodeApp.swift
//  Shared
//
//  Created by DaBazar on 23.01.21.
//

import SwiftUI
import Recoil

@main
struct NotXcodeApp: App {

    @Value(AppState.selectedCanvasID) var selectedCanvasID

    init() {
        (0..<1).forEach {_ in
            Canvas.Mutation.newNode(in: selectedCanvasID)
        }

    }
    var body: some Scene {
        return WindowGroup {
            VStack {
                CanvasView(canvasID: selectedCanvasID)
            }
        }
    }
}

typealias AtomFamily = Recoil.AtomFamily
typealias Atom = Recoil.Atom
typealias Value = Recoil.Value
typealias Selector = Recoil.Selector
typealias MutableValue = Recoil.MutableValue

