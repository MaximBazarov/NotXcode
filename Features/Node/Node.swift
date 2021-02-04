//
//  Node.swift
//  NotXcode
//
//  Created by DaBazar on 02.02.21.
//

import Foundation


struct Node: Codable, Identifiable {
    struct ID: Hashable, Codable { let value: String }

    let id: ID
    let name: String
//    let offset: Offset

    struct Parameter: Codable {
        enum Kind: String, Codable {
            case just
        }

        let node: UUID
        let name: String
        let kind: Kind
    }
}
