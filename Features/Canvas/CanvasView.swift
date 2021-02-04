//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI


struct CanvasView: View {

    @MutableValue var nodes: [Node.ID]

    init(id: Canvas.ID) {
        _nodes = MutableValue(Canvas.State.nodesOnCanvas[id])
    }

    var body: some View {
        GeometryReader { reader in
            ForEach(0..<nodes.count) { index in
                NodeView(id: nodes[index])
            }
        }
        .clipped()
        .background(BackgroundGridView())
        .drawingGroup(opaque: true)
        .ignoresSafeArea(.all)
    }

}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(id: Canvas.ID(id: ""))
    }
}


