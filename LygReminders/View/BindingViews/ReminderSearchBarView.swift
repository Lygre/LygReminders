//
//  ReminderSearchBarView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

// MARK: ReminderSearchBarView
/// Contains the Binding search bar text field used to filter reminders
struct ReminderSearchBarView: View {
    
    @Binding var searchQueryText: String
    
    
    // MARK: - Content View Struct
    /// private Content View struct
    fileprivate struct Content: View {
        @Binding var searchQueryText: String
        
        var body: some View {
            VStack(alignment: .trailing) {
                HStack {
                    Text("Hi")
                }
                
                Spacer()
                
                ZStack(alignment: .center) {
                    TextField("BarItemTrlPlchldr",
                              text: $searchQueryText,
                              onEditingChanged: { (_) in },
                              onCommit: {  })
                }
            }
        }
    }
    
    var body: some View {
        Content(searchQueryText: $searchQueryText)
    }
    
}

#if DEBUG
struct ReminderSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSearchBarView(searchQueryText: .constant(""))
    }
}
#endif
