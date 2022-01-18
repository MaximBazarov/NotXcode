//
//  Canvas.swift
//  NotXcode
//
//  Created by DaBazar on 02.02.21.
//

import Decore
import SwiftUI


/// **Feature:** Canvas
///
/// **Responsibility:** to manage a collection of nodes and connectors,
/// also zooming and scrolling positions
///
struct Canvas: Codable {

    var id: ID
    var nodes: [Node.ID]
    var zoom: CGFloat = 1
    var size = CGSize(width: 5000,height: 5000)


    struct ID: Hashable, Codable, Identifiable {
        var id: String
    }
}


// MARK: - State

extension Canvas {


    /// Index of all canvases
    struct Index: AtomicState {
        typealias Value = [Canvas.ID]
        static var initialValue: () -> Value = { [] }
    }

    /// Index of all ``Node``s in ``Canvas``
    struct Nodes: GroupState {
        typealias Element = [Node.ID]
        typealias ID = Canvas.ID

        static func initialValue(for id: Canvas.ID) -> [Node.ID] {
            print("Here")
            return [
                Node.ID(id: "node1"),
                Node.ID(id: "node2"),
                Node.ID(id: "node3"),
            ]
        }
    }

    /// Storage of all canvases
    struct All: GroupState {
        typealias Element = Canvas
        typealias ID = Canvas.ID

        static func initialValue(for id: ID) -> Element {
            Canvas(id: id, nodes: [])
        }
    }

    // should be changed to get this from a document
    // CanvasView is open for the canvas ID so it's enough to know
    struct SelectedCanvas: AtomicState {
        typealias Value = Canvas.ID
        static var initialValue: () -> Value = { Canvas.ID(id: "canvas") }
    }

    struct NewNodeId: ComputedState {
        typealias Value = Node.ID

        static func shouldStoreComputedValue() -> Bool {
            false
        }

        static func value(read: Storage.Reader) -> Node.ID {
            Node.ID(id: UUID().uuidString)
        }
    }
}


// MARK: - Types

public struct Position: Codable {

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

    public static let zero = Position(x: 0, y: 0)

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
