//
//  Experiment.swift
//  NotXcode
//
//  Created by DaBazar on 29.01.21.
//

import SwiftUI

struct Experiment: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .frame(width: 100, height: 100)
            Text("Hello")
        }

    }
}

struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment()
    }
}
