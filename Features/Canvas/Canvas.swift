//
//  Canvas.swift
//  NotXcode
//
//  Created by DaBazar on 02.02.21.
//

import Recoil
import SwiftUI


/// **Feature:** Canvas
///
/// **Responsibility:** to manage a collection of nodes and connectors,
/// also zooming and scrolling positions
///
struct Canvas: Codable {

    let id: ID
    let nodes: [Node.ID]

    struct ID: Hashable, Codable { let value: String}
}

extension Canvas {
    struct State {


        static let nodeCatalog = AtomFamily<Node.ID, Node>(
            initial: { id in
                return Node(id: id, name: "Name")
            }
        )

        static let parametersCatalog = AtomFamily<Node.ID, [Node.Parameter]>(
            initial: { _ in []}
        )
    }
}

extension Canvas {

    struct Offset: Codable {
        let top: CGFloat
        let leading: CGFloat
    }

    struct Scale: Codable {
        let width: CGFloat
        let height: CGFloat
        let offset: CGPoint
    }

    struct Preferences: Codable {
        let scale: Scale
        let offset: Offset
        let size: CGSize
    }

}
