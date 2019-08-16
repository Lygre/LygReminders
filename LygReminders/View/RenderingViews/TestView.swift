//
//  TestView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/15/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI
import CoreData

struct TestView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ReminderListStore().controller.fetchRequest) var reminderItems: FetchedResults<ReminderItem>
    
    @State private var emptyStringState = ""
    @State private var testBooleanState = true
    
//    @Binding var boundVariable: Type
    
    var body: some View {
        Group {
            if testBooleanState {
                List {
                    ForEach(self.reminderItems.map({ Reminder(managedObject: $0) }), id: \.id) { reminder in
                        Text(reminder.title)
                    }
//                    Text("Hi")
//                    Text("Hey")
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
        .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        .environment(\.editMode, .constant(EditMode.active))
    }
}
#endif
