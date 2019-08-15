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
    // MARK: - Wrapped Properties
    /// Core Data with SwiftUI setup
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ReminderItem.getAllReminderItems()) var reminderItems: FetchedResults<ReminderItem>
    
    /// Other properties with property wrappers
    @Environment(\.editMode) var editMode: Binding<EditMode>
    
    // MARK: Constants & Properties
    
    
    
    //MARK: View Body
    var body: some View {
        NavigationView {
            Group {
                HomeNewSearchSection()
                    .padding(.bottom, 10)
                Divider()
                List {
                    ForEach(self.reminderItems.map({ $0.reminderViewModel() }), id: \.self) { reminderItem in
                        Text(reminderItem.title)
                            .background(Color.blue)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


#if DEBUG
struct RemindersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersHomeView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
    }
}
#endif


