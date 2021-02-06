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

    var id: ID
    var nodes: [Node.ID]

    struct ID: Hashable, Codable { let value: String}
}


// MARK: - State

extension Canvas {

    struct State {


        static let allNodes = AtomFamily<Node.ID, Node>(
            initial: { id in
                return Node(id: id, name: "Name")
            }
        )

        static let nodesPositions = AtomFamily<Node.ID, Position>(
            initial: { id in
                return Position(x: 0, y: 0)
            }
        )

        static let parametersCatalog = AtomFamily<Node.ID, [Node.Parameter]>(
            initial: { _ in []}
        )
    }
}


// MARK: - Mutations

extension Canvas {

    enum Mutation {

        static func newNode(in canvasID: Canvas.ID, _ position: Position = .zero) {
            let canvas = Application.State.allCanvases[canvasID]
            let id = Node.ID(value: "Node-\(UUID().uuidString)")
            let nodeAtom = Atom<Node>(initial: {
                Node(id: id, name: "NoNameNode")
            })
            Canvas.State.allNodes[id] = nodeAtom
            Canvas.State.nodesPositions[id].value = Position.random(5000)
            canvas.value.nodes.append(id)
        }

    }



}

// MARK: - Types

struct Position: Codable {


    let x: CGFloat
    let y: CGFloat

    static func + (lhs: Position, rhs: CGSize) -> Position {
        Position(x: lhs.x + rhs.width, y: lhs.x + rhs.height)
    }

    static func + (lhs: CGSize, rhs: Position) -> Position {
        return rhs + lhs
    }

    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }

    init(cgPoint: CGPoint) {
        x = cgPoint.x
        y = cgPoint.y
    }

    static let zero = Position(x: 0, y: 0)

    init(cgSize: CGSize) {
        x = cgSize.width
        y = cgSize.height
    }

    var asCGSize: CGSize {
        CGSize(width: self.x, height: self.y)
    }

    static func random(_ value: CGFloat) -> Position {
        Position(
            x: .random(in: (0..<value)),
            y: .random(in: (0..<value))
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
