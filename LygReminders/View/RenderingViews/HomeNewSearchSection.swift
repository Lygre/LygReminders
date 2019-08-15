//
//  HomeNewSearchSection.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/15/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct HomeNewSearchSection: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var newReminderTitle = ""
    
    @State private var remindersQueryString = ""
    
    var body: some View {
        Section(header: ReminderSearchBarView(searchQueryText: $remindersQueryString)) {
            HStack {
                TextField("New Reminder Title", text: $newReminderTitle, onEditingChanged: { (_) in }, onCommit: { })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    let reminderItem = ReminderItem(context: self.managedObjectContext)
                    reminderItem.title = self.newReminderTitle
                    reminderItem.isFlagged = false
                    reminderItem.notes = ""
                    reminderItem.url = nil
                    reminderItem.images = nil
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                    
                    self.newReminderTitle = ""
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .padding(.horizontal, 10)
        }
        .foregroundColor(.green)
    }
}

#if DEBUG
struct HomeNewSearchSection_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeNewSearchSection()
    
    }
}
#endif
