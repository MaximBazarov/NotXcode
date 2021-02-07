//
//  NodeView.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI
import Recoil

struct NodeView: View {
    
    @MutableValue var nodePosition: Position
    @MutableValue var node: Node
    
    init(id: Node.ID) {
        _node = MutableValue(Node.State.all[id])
        _nodePosition = MutableValue(Canvas.State.nodesPositions[id])
    }
    
    var foregroundColor: Color = Color.accOrange
    
    var body: some View {
        
        return GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                NodeTitle(node: _node)
                if node.parameters.count > 0 {
                    ParameterListView(parameters: node.parameters)
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
                position: $nodePosition
            )
            
            
            
        }
        
    }
}


struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(id: Node.ID(value:""))
    }
}
