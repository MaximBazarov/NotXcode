//
//  BackgroundGridView.swift
//  NotXcode
//
//  Created by DaBazar on 31.01.21.
//

import SwiftUI

struct BackgroundGridView: View {

    var spacing: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            Rectangle().background(Color.background)
            Path { path in
                let numberOfHorizontalGridLines = Int(
                    geometry.size.height / self.spacing
                )

                let numberOfVerticalGridLines = Int(
                    geometry.size.width / self.spacing
                )

                for index in 0...numberOfVerticalGridLines {
                    let vOffset: CGFloat = CGFloat(index) * self.spacing
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(
                        to: CGPoint(
                            x: vOffset,
                            y: geometry.size.height
                        )
                    )
                }
                for index in 0...numberOfHorizontalGridLines {
                    let hOffset: CGFloat = CGFloat(index) * self.spacing
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(
                        to: CGPoint(
                            x: geometry.size.width,
                            y: hOffset
                        )
                    )
                }
            }
            .stroke(Color.grid)
            Path { path in
                let numberOfHorizontalGridLines = Int(geometry.size.height / self.spacing)
                let numberOfVerticalGridLines = Int(geometry.size.width / self.spacing)
                for index in 0...numberOfVerticalGridLines / 5 {
                    let vOffset: CGFloat = CGFloat(index) * self.spacing * 5
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
                }
                for index in 0...numberOfHorizontalGridLines / 5 {
                    let hOffset: CGFloat = CGFloat(index) * self.spacing * 5
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
                }
            }
            .stroke(Color.grid, lineWidth: 2)
            .drawingGroup(opaque: true)
        }
    }

}

struct BackgroundGridView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGridView().ignoresSafeArea(.all)
    }
}
