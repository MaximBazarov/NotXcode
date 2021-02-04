//
//  App.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 02.02.21.
//

import Foundation

struct Application {

    struct State {

        static let selectedCanvas = Atom<Canvas.ID>(initial: {
            return Canvas.ID(id: "")
        })

        static let canvasCatalog = AtomFamily<Canvas.ID, Canvas> { id in
            Canvas(id: id)
        }
    }
}
