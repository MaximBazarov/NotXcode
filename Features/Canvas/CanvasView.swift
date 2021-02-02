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
        if let node = Canvas.State.nodesOnCanvas.at(id: id) {
            _nodes = MutableValue(node)
        }
        
    }

    var body: some View {

        let zoom = 1 // preferences.scale.width

        GeometryReader { reader in
            ForEach(0..<nodes.count) { index in
                NodeView(id: nodes[index])
            }
        }
        .scaleEffect(CGSize(width: zoom, height: zoom), anchor: .center)
        .clipped()
        .background(BackgroundGridView())
        .drawingGroup(opaque: true)
        .ignoresSafeArea(.all)
            HStack(spacing: 16) {
                Text("\(zoom)")
//                Button("Zoom Out") {
//                    var zoom = self.zoom
//                    zoom -= 0.05
//                    if zoom < 0.1 { zoom = 0.1 }
//                    self.zoom = zoom
//                }
//                Button("Zoom In") {
//                    var zoom = self.zoom
//                    zoom += 0.05
//                    if zoom > 3 { zoom = 3 }
//                    self.zoom = zoom
//                }
            }
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


