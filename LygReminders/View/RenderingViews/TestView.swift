//
//  TestView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/15/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @State private var emptyStringState = ""
    @State private var testBooleanState = false
    
//    @Binding var boundVariable: Type
    
    var body: some View {
        Group {
            if testBooleanState {
                VStack {
                    Text("Placeholder")
                }
            } else {
                VStack {
                    Image(systemName: "nosign")
                        .imageScale(.large)
                }
            }
        }
    }
}

#if DEBUG
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
#endif
