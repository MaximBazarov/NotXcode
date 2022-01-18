//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI
import Decore


struct CanvasView: View {

    var id: Canvas.ID

    @Bind(Canvas.All.self) var canvas
    @Bind(Canvas.Nodes.self) var nodes
    @Observe(Canvas.NewNodeId.self) var newNodeID

    var body: some View {
        return VStack{
            List(nodes[id]) { node in
                Text("\(node.id)")
            }
            ZStack {
                ForEach(canvas[id].nodes) { node in
                    NodeView(id: node).scaleEffect(canvas[id].zoom)
                }
            }
            .clipped()
            .background(Color.background)
            .drawingGroup(opaque: true)
            .frame(width: 600, height: 600)
            .ignoresSafeArea(.all)
            .gesture(
                MagnificationGesture().onChanged({ value in
                    canvas[id].zoom -= (1 - value)/20
                })
            )

        }
        .background(Color.background)
    }
}


// MARK: - Preview

struct BoardView_Previews: PreviewProvider {

    static var previews: some View {
        CanvasView(id: singleCanvas)
    }

}


