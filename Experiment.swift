//
//  Experiment.swift
//  NotXcode
//
//  Created by DaBazar on 29.01.21.
//

import SwiftUI
//
//@frozen @propertyWrapper public struct Selector<Value> : DynamicProperty {
//
//    public init(_ initialValue: Value, denormalise: (Int)->Void) {
//        self.wrappedValue = initialValue
//    }
//
//    public var wrappedValue: Value
//
//}
//
//
//
//public class AppCore: ObservableObject {
//}
//
//@frozen @propertyWrapper public struct Mutation<Value> : DynamicProperty {
//
//
//    public init(_ mutator: @escaping ()->Value ) {
//        self.wrappedValue = Binding(get: { return mutator() }, set: { _ in })
//    }
//
//    public var wrappedValue: Binding<Value>
//
//}
//
//@frozen @propertyWrapper public struct Query<Value> : DynamicProperty {
//
//
//    public init(_ query: @escaping ()->Value ) {
//        self.wrappedValue = query()
//    }
//
//    public var wrappedValue: Value
//
//}
//
//func BindUsername() -> Binding<String> {
//    return Binding(
//        get: {
//            return ""
//        },
//        set: {_ in }
//    )
//}
//
////struct StatelessView: ViewBuilder {
////
////    weak var core: AppCore?
////
////    func body(content: Content) -> some View {
////        return content
////    }
////}
////
////extension View {
////    func stateless(on core: AppCore) -> some View {
////        return self.modifier(StatelessView(core: core))
////    }
////}
//
//
struct Experiment: View {

    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .frame(width: 100, height: 100)
//            TextField("", text: self.userName)
        }

    }
}

struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment()
    }
}
