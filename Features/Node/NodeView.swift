//
//  NodeView.swift
//  NotXcode (iOS)
//
//  Created by DaBazar on 28.01.21.
//

import SwiftUI

struct NodeView: View {

    var parameters: [String] = [ "login", "countercounter", "anotherOne"]
    var name: String = "AppState"

    var foregroundColor: Color = Color.accOrange

    var body: some View {
        VStack(alignment: .center, spacing: 0) {

            // Header
            NodeTitle()

            // Output
            VStack(alignment: .trailing) {
                ForEach(parameters, id: \.self){ item in
                    ParameterOutlet(
                        title: item,
                        color: Color.accOrange
                    )
                }
            }
            .padding()
            .foregroundColor(.accOrange)
            .background(Color.bgOrange.cornerRadius(10, corners: [.bottomLeft, .bottomRight]))
        }
        .padding(3)
        .background(
            Color.accOrange
                .cornerRadius(10)
                .shadow(color: Color.accOrange.opacity(0.1), radius: 20, x: 0, y: 10)
        )



    }
}


struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView()
    }
}


// MARK: - Parameter Outlet

struct ParameterOutlet: View {

    var title: String = ""
    var color: Color = .accentColor
    var strokeWidth: CGFloat = 2

    var body: some View {
        HStack {
            Text(title)
                .font(.body)

            Circle()
                .stroke(color,
                        style: StrokeStyle(lineWidth: strokeWidth)
                )
                .frame(width: 20, height: 20)
        }
    }
}


// MARK: - Node Title

struct NodeTitle: View {
    var title: String = ""

    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
    }
}
