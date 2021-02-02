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

    struct ID: Hashable, Codable {
        let value: String

        init(id: String) {
            self.value = "Canvas.ID-\(id)"
        }
    }
}

extension Canvas {
    struct State {
        static let nodesOnCanvas = Family<Canvas.ID, [Node.ID]>()
        static let nodeCatalog = Family<Node.ID, Node>()
        static let parametersCatalog = Family<Node.ID, Node.Parameter>()
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
