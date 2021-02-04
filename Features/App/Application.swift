//
//  App.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 02.02.21.
//

import Foundation

struct Application {

    struct State {

        static let selectedCanvas = Selector<Canvas> { get in
            let id = get(selectedCanvasID)
            let canvas = get(canvasCatalog[id])
            return canvas
        }

        static let selectedCanvasID = Atom<Canvas.ID>(initial: {
            return Canvas.ID(value: "")
        })

        static let canvasCatalog = AtomFamily<Canvas.ID, Canvas> { id in
            Canvas(id: id, nodes: [
                Node.ID(value: "")
            ])
        }
    }


}
