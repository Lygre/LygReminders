//
//  ReminderStore.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData


final class ReminderStore: ObservableObject {
    
    static let shared = ReminderStore()
    
    @Published var reminders: [Reminder] = []
    
}


final class ReminderListStore: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    // MARK: Published Properties
    @Published var results = [Reminder]()
    // MARK: Properties
    var controller = NSFetchedResultsController<ReminderItem>()
    
    // Initializer
    override init() {
        super.init()
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        
    }
    
    
    
    /// Conformance to NSFetchedResultsControllerDelegate
    /// - Parameter controller: Gives us access to the ManagedObjectContext, fetched objects, among other things
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        guard let fetchedReminderItems = controller.fetchedObjects as? [ReminderItem] else {
            debugPrint("")
            return }
        
        var reminders = [Reminder]()
        
        for reminderItem in fetchedReminderItems {
            reminders.append(reminderItem.reminderViewModel())
        }
        
        self.results = reminders
    }
    
}

