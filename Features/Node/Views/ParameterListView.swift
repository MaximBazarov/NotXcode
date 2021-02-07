//
//  ParameterListView.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 07.02.21.
//

import SwiftUI

struct ParameterListView: View {
    
    var parameters: [Node.Parameter.ID]
    
    var body: some View {
        HStack {
            VStack{
                ForEach(0..<parameters.count) { index in
                    NodeParameterView(parameterID: parameters[index])
                }
            }
        }
        .padding()
        .foregroundColor(.accOrange)
        .background(Color.bgOrange)
        .drawingGroup(opaque: false)
    }
}

struct ParameterListView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterListView(parameters: [
            Node.Parameter.ID(value: "1"),
            Node.Parameter.ID(value: "2"),
            Node.Parameter.ID(value: "3"),
        ])
    }
}
