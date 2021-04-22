//
//  Exper.swift
//  NotXcode
//
//  Created by Maxim Bazarov on 12.02.21.
//

import SwiftUI

struct Exper: View {
    var body: some View {
        HStack{
            Rectangle().frame(minWidth: 1000).foregroundColor(.blue)
        }.frame(maxWidth: 100).background(Color.red)
    }
}

struct Exper_Previews: PreviewProvider {
    static var previews: some View {
        Exper()
    }
}
