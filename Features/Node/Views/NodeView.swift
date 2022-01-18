//
//  NodeView.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI
import Decore

struct NodeView: View {

    var id: Node.ID

    @Bind(Node.Positions.self) var nodePosition
    @Bind(Node.All.self) var node

    var foregroundColor: Color = Color.accOrange
    
    var body: some View {
        
        return GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                NodeTitle(id: id)
                if node[id].parameters.count > 0 {
                    ParameterListView(parameters: node[id].parameters)
                }                
            }
            .background(
                Color.bgOrange
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color.accOrange,
                        style: StrokeStyle(lineWidth: 2)
                    )
            )
            .shadow(
                color: Color.bgOrange.opacity(0.1),
                radius: 10, x: 0, y: 2
            )
            .draggable(
                position: $nodePosition[id]
            )
            
            
            
        }
        
    }
}


struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(id: Node.ID(id:""))
    }
}
