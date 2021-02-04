//
//  NodeView.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI
import Recoil

struct NodeView: View {

    @MutableValue var node: Node

    var foregroundColor: Color = Color.accOrange

    var body: some View {
        return GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                NodeTitle(node: node)
//                ParameterList(parameters: node.parameters)
            }
            .padding(3)
            .clipped()
            .background(
                Color.accOrange
                    .cornerRadius(10)
                    .shadow(color: Color.bgOrange.opacity(0.1), radius: 10, x: 0, y: 2)
            )
            .offset(CGSize(width: CGFloat.random(in: (0...5000)), height: CGFloat.random(in: (0...5000))))
            .draggable()

        }

    }
}


struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(node: MutableValue<Node>(Atom<Node>(initial: {
            Node(
                id: Node.ID(value: "Preview"),
                name: "Preview",
                parameters: []
            )
        })))
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

    var node: Node

    var body: some View {
        Text(node.name)
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
