//
//  Node.swift
//  NotXcode
//
//  Created by DaBazar on 02.02.21.
//

import Foundation
import Decore


public struct Node: Codable {

    let id: ID
    let name: String
    let position: Position
    let parameters: [Parameter.ID]

    public struct ID: Hashable, Codable, Identifiable { public let id: String }
}


// MARK: - State

extension Node {

    /// Storage for all nodes in all canvases
    struct All: GroupState {
        typealias Element = Node
        typealias ID = Node.ID

        static func initialValue(for id: Node.ID) -> Node {
            Node(
                id: id,
                name: "NoNameNode",
                position: Position(x: 0, y: 0),
                parameters: Array(
                    repeating: Node.Parameter.ID(id: "Node.Parameter-\(UUID().uuidString)"),
                    count: 4
                )
            )
        }
    }

    /// Position of the node with id
    struct Positions: GroupState {
        typealias Element = Position
        typealias ID = Node.ID

        static func initialValue(for id: ID) -> Element {
            Position(x: 0, y: 0)
        }
    }

    /// Parameters of the node with id
    struct Parameters: GroupState {
        typealias Element = Node.Parameter
        typealias ID = Node.Parameter.ID

        static func initialValue(for id: ID) -> Element {
            Parameter(
                id: id,
                name: "parameter",
                kind: .output,
                position: .zero
            )
        }
    }
}


// MARK: - Types

public extension Node {

    struct Parameter: Codable {

        let id: ID
        let name: String
        let kind: Kind
        let position: Position

        public struct ID: Hashable, Codable, Identifiable { public let id: String }

        public enum Kind: String, Codable {
            case output
            case input
        }

    }

}
