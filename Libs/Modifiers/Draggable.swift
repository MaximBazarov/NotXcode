//
//  Draggable.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI

struct Draggable: ViewModifier {
    @State var isDragging: Bool = false

    @State var offset: CGSize = .zero
    @State var dragOffset: CGSize = .zero

    var onChanged: ((CGSize) -> Void)?
    var onEnded: ((CGSize) -> Void)?

    func body(content: Content) -> some View {
        let drag = DragGesture()
            .onChanged { (value) in
                self.offset = self.dragOffset + value.translation
                self.isDragging = true
                self.onChanged?(self.offset)
            }.onEnded { (value) in
                self.isDragging = false
                self.offset = self.dragOffset + value.translation
                self.dragOffset = self.offset
                self.onEnded?(self.offset)
            }
        return content.offset(offset).gesture(drag)
    }
}

extension View {
    func draggable(onChanged: ((CGSize) -> Void)? = nil, onEnded: ((CGSize) -> Void)? = nil) -> some View {
        return self.modifier(Draggable(onChanged: onChanged, onEnded: onEnded))
    }
}
