//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI


struct CanvasView: View {

    @MutableValue var canvas: Canvas

    init(canvasID: Canvas.ID) {
        _canvas = MutableValue(Canvas.State.all[canvasID])
    }

    var body: some View {
        ZStack {
            Text("\(canvas.zoom)").foregroundColor(.blue).zIndex(5)
            ZStack {
                ForEach(canvas.nodes) { node in
                    NodeView(id: node).scaleEffect(canvas.zoom)
                }

            }
            .clipped()
            .background(Color.background)
            .drawingGroup(opaque: true)
            .ignoresSafeArea(.all)

            .gesture(
                MagnificationGesture().onChanged({ value in
                    canvas.zoom -= (1 - value)/20
                    print(value.magnitude)

                })
            ).onTapGesture {
                print("tap")
                return Canvas.Mutation.newNode(in: canvas.id)
            }
        }.background(Color.background)
    }

}


// MARK: - Preview

struct BoardView_Previews: PreviewProvider {

    static var previews: some View {
        CanvasView(canvasID: Canvas.ID(id: ""))
    }

}


