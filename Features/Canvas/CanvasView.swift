//
//  NodeView.swift
//  NotXcode
//
//  Created by DaBazar on 27.01.21.
//

import SwiftUI


struct CanvasView: View {

    @MutableValue var canvas: Canvas
    @GestureState var magnifyBy = CGFloat(1.0)

    init(canvasID: Canvas.ID) {
        _canvas = MutableValue(Canvas.State.all[canvasID])
    }

    var body: some View {
        ZStack {
            ZStack {
                ForEach(canvas.nodes) { node in
                    NodeView(id: node)
                }
            }
            .clipped()
            .background(Color.background)
            .drawingGroup(opaque: true)
            .ignoresSafeArea(.all)
            .scaleEffect(canvas.zoom)
            .gesture(
                MagnificationGesture().updating($magnifyBy) {
                    currentState, gestureState, transaction in
                    canvas.zoom = currentState
                }
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


