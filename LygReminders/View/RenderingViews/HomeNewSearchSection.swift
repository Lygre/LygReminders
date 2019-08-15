//
//  HomeNewSearchSection.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/15/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct HomeNewSearchSection: View {
    
    @State private var newReminderTitle = ""
    
    @State private var remindersQueryString = ""
    
    var body: some View {
//        VStack {
            Section(header: ReminderSearchBarView(searchQueryText: $remindersQueryString)) {
                HStack {
                    TextField("New Reminder Title", text: $newReminderTitle, onEditingChanged: { (_) in }, onCommit: { })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
                .padding(.horizontal, 10)
//                Spacer()
            }
            .foregroundColor(.green)
//            Spacer()
//        }
    }
}

#if DEBUG
struct HomeNewSearchSection_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeNewSearchSection()
    
    }
}
#endif
