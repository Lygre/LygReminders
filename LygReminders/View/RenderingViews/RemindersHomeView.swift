//
//  ContentView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: - Reminders Home View

struct RemindersHomeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ReminderItem.getAllReminderItems()) var reminderItems: FetchedResults<ReminderItem>
    // MARK: Constants & Properties
    
    
    
    //MARK: View Body
    var body: some View {
        NavigationView {
            Group {
                HomeNewSearchSection()
//                List {
                    Text("PH")
//                    ForEach(
                    
//                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
}


#if DEBUG
struct RemindersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersHomeView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
    }
}
#endif


