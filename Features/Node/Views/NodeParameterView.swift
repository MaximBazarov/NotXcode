//
//  NodeParameterView.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 07.02.21.
//

import SwiftUI
import Decore

struct NodeParameterView: View {

    var id: Node.Parameter.ID

    @Bind(Node.Parameters.self) var parameters
    
    var body: some View {
        HStack {
            Text(parameters[id].name)
                .font(.body)
            OutletView()
        }
    }
}


struct NodeParameterView_Previews: PreviewProvider {
    static var previews: some View {
        NodeParameterView(
            id: Node.Parameter.ID(id: "")
        )
    }
}
