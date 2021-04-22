//
//  Node.swift
//  NotXcode
//
//  Created by DaBazar on 02.02.21.
//

import Foundation


public struct Node: Codable {

    let id: ID
    let name: String
    let position: Position
    let nodes: [Node.ID]
    let parameters: [Parameter.ID]

    public struct ID: Hashable, Codable, Identifiable { public let id: String }

    public init(id: Node.ID? = nil, name: String = "", position: Position = .zero, nodes: [Node.ID] = [], parameters: [Node.Parameter.ID] = []) {
        self.id = id ?? Node.ID(id: "Node-\(UUID().uuidString)")
        self.name = name
        self.position = position
        self.nodes = nodes
        self.parameters = parameters
    }
}


// MARK: - State

extension Node {
    struct State {

        static let all = AtomFamily<Node.ID, Node>(
            initial: { id in
                return Node(id: id, name: "Name")
            }
        )
        
        static let parameters = AtomFamily<Parameter.ID, Parameter>(
            initial:  { id in
                Parameter(id: id, name: "parameter", kind: .output, position: .zero)
            }
        )

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
