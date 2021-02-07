
// TODO: Optimise use KeyPreference (Maxim)

import SwiftUI

struct Draggable: ViewModifier {

    @Binding var position: Position

    func body(content: Content) -> some View {
        let drag = DragGesture()
            .onChanged { value in
                let offset = CGSize(width: value.startLocation.x, height: value.startLocation.y)
                self.position = Position(cgSize: offset + value.translation)
            }
            .onEnded { value in

            }

//
//            .onChanged { value in
//                self.position = Position(cgSize: self.dragOffset + value.translation)
//            }
//            .onEnded { value in
//
//            }

        return withAnimation {      
            content.offset(position.asCGSize).gesture(drag)
        }

    }
}
extension View {
    func draggable(
        position: Binding<Position>,
        onChanged: ((Position) -> Void)? = nil,
        onEnded: ((Position) -> Void)? = nil
    ) -> some View {
        return self.modifier(
            Draggable(
                position: position
            )
        )
    }
}
