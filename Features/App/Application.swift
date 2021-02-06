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
            let canvas = get(allCanvases[id])
            return canvas
        }.update { canvas in
            allCanvases[canvas.id].value = canvas
        }

        static let selectedCanvasID = Atom<Canvas.ID>(initial: {
            return Canvas.ID(value: "")
        })

        static let allCanvases = AtomFamily<Canvas.ID, Canvas> { id in
            Canvas(id: id, nodes: [
                Node.ID(value: "")
            ])
        }
    }


}
