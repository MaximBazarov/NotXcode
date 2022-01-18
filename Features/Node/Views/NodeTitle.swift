//
//  NodeTitle.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 06.02.21.
//

import SwiftUI
import Decore

struct NodeTitle: View {

    var id: Node.ID

    @Bind(Node.All.self) var node

    var body: some View {
        Text(node[id].name)
            .font(.headline)
            .padding()
            .background(
                Color.accOrange
            )
    }
}

struct NodeTitle_Previews: PreviewProvider {

    static var previews: some View {
        NodeTitle(id: Node.ID(id: "Preview"))
    }
}
