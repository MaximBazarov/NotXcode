//
//  NodeParameterView.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 07.02.21.
//

import SwiftUI

struct NodeParameterView: View {
    
    @MutableValue var parameter: Node.Parameter
    
    init(parameterID: Node.Parameter.ID) {
        _parameter = MutableValue(
            Node.State.parameters[parameterID]
        )
    }
    
    var body: some View {
        HStack {
            Text("title that long long long ass")
                .font(.body)
        }
    }
}


struct NodeParameterView_Previews: PreviewProvider {
    static var previews: some View {
        NodeParameterView(
            parameterID: Node.Parameter.ID(value: "")
        )
    }
}
