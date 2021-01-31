//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI

struct CanvasView: View {

    @State var point = CGSize(width: 100, height: 100)

    var body: some View {
        GeometryReader { reader in
            NodeView()
                .offset(point)
                .draggable(
                    onChanged: { (size) in
                        self.point = size / reader.size
                    },
                    onEnded: { size in
                        print(size)
                    }
                )
        }
        .background(BackgroundGridView())
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
        CanvasView()
    }
}


