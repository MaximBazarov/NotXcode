//
//  NodeView.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI
import Recoil

struct NodeView: View {

    var nodeID: Node.ID

    @MutableValue var nodePosition: Position

    init(id: Node.ID) {
        nodeID = id
        _nodePosition = MutableValue(Canvas.State.nodesPositions[id])
    }

    var foregroundColor: Color = Color.accOrange

    var body: some View {
        print("Render: NodeView: \(nodeID)")
        return GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                NodeTitle(/*id: nodeID*/)
//                ParameterList(parameters: node.parameters)
            }
            .padding(3)
            .clipped()
            .background(
                Color.accOrange
                    .cornerRadius(8)
                    .shadow(
                        color: Color.bgOrange.opacity(0.1),
                        radius: 10, x: 0, y: 2
                    )
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


// MARK: - Parameter Outlet

struct ParameterOutlet: View {

////    @Value var parameter: Canvas.Node.Parameter
//
//    init(parameterID: UUID) {
//        _parameter = Value(Canvas.parametersCatalog.at(id: parameterID))
//    }

    var body: some View {
        HStack {
            Text("title")
                .font(.body)

            Circle()
                .stroke(
                    Color.accOrange,
                    style: StrokeStyle(lineWidth: 1)
                )
                .drawingGroup(opaque: true)
                .frame(width: 20, height: 20)
        }
    }
}


// MARK: - Node Title

struct NodeTitle: View {

//    @MutableValue var node: Node

//    init(id: Node.ID) {
//        _node = MutableValue(Canvas.State.allNodes[id])
//    }

    var body: some View {
        Text("node.name")
            .font(.headline)
            .padding()
    }
}


//struct ParameterList: View {
//
//    var parameters: [UUID]
//
//    var body: some View {
//        VStack(alignment: .trailing) {
//            ForEach(0..<parameters.count) { index in
//                ParameterOutlet(parameterID: parameters[index])
//            }
//        }.padding()
//        .foregroundColor(.accOrange)
//        .background(Color.bgOrange.cornerRadius(10, corners: [.bottomLeft, .bottomRight]))
//    }
//}
//
