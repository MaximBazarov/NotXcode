//
//  App.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 02.02.21.
//

import Foundation

struct Application {

    struct State {

        static let selectedCanvas = Atom {
            Canvas.ID(id: UUID().uuidString)
        }

        static let canvasCatalog = Family<Canvas.ID, Canvas>()
    }
}
