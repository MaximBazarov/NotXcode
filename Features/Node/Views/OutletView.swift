//
//  OutletView.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 07.02.21.
//

import SwiftUI

struct OutletView: View {
    var body: some View {
        Circle()
            .stroke(
                Color.accOrange,
                style: StrokeStyle(lineWidth: 2)
            )
            .drawingGroup(opaque: true)
            .frame(width: 20, height: 20)
    }
}

struct OutletView_Previews: PreviewProvider {
    static var previews: some View {
        OutletView()
    }
}
