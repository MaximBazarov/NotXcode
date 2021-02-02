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

    @Value var selectedCanvas: Canvas.ID

    init() {
        _selectedCanvas = Value(Application.State.selectedCanvas)
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                CanvasView(id: selectedCanvas)
            }
        }
    }
}

typealias Family = Recoil.Family
typealias Atom = Recoil.Atom
typealias Value = Recoil.Value
typealias Selector = Recoil.Selector
typealias MutableValue = Recoil.MutableValue

