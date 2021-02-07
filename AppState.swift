//
//  App.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 02.02.21.
//

import SwiftUI


struct AppState {

    // should be changed to get this from a document
    // CanvasView is open for the canvas ID so it's enough to know
    static let selectedCanvasID = Atom<Canvas.ID>(initial: {
        return Canvas.ID(value: "")
    })

    static let selectedCanvas = Selector<Canvas> { get in
        let id = get(selectedCanvasID)
        let canvas = get(Canvas.State.all[id])
        return canvas
    }.update { canvas in
        Canvas.State.all[canvas.id].value = canvas
    }

}
