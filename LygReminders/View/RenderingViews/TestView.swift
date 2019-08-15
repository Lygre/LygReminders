//
//  TestView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/15/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @State private var newReminderTitle = ""
    
    @State private var remindersQueryString = ""
    
    var body: some View {
        VStack {
            Section(header: ReminderSearchBarView(searchQueryText: $remindersQueryString)) {
                ZStack(alignment: .center) {
                    HStack {
                        TextField("New Reminder Title", text: $newReminderTitle, onEditingChanged: { (_) in }, onCommit: { })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .foregroundColor(.green)
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
