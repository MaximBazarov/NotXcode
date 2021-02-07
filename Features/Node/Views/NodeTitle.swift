//
//  NodeTitle.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 06.02.21.
//

import SwiftUI

struct NodeTitle: View {

    @MutableValue var node: Node

    var body: some View {
        Text(node.name)
            .font(.headline)
            .padding()
            .background(
                Color.accOrange
            )
    }
}

struct NodeTitle_Previews: PreviewProvider {
    
    static let previewNode = MutableValue(Atom {
        Node(name: "PreviewNode")
    })


    static var previews: some View {
        NodeTitle(node: previewNode)
    }
}
