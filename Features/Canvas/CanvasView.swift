//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI


struct CanvasView: View {

    var canvas: Canvas

    init(canvas: Canvas) {
        self.canvas = canvas
    }

    var body: some View {
        ZStack {
            ForEach(0..<canvas.nodes.count) { index in
                NodeView(id: canvas.nodes[index])
            }
        }
        .clipped()
        .background(BackgroundGridView())
        .drawingGroup(opaque: true)
        .ignoresSafeArea(.all)
    }

}
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners))
//    }
//}
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(
            canvas: Canvas(
                id: Canvas.ID(value: ""),
                nodes: []
            )
        )
    }
}


