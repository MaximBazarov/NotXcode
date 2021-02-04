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

    @Value(Application.State.selectedCanvas) var selectedCanvas

    var body: some Scene {
        WindowGroup {
            VStack {
                CanvasView(canvas: selectedCanvas)
            }
        }
    }
}

typealias AtomFamily = Recoil.AtomFamily
typealias Atom = Recoil.Atom
typealias Value = Recoil.Value
typealias Selector = Recoil.Selector
typealias MutableValue = Recoil.MutableValue

