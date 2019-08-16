//
//  Reminder.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/8/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


public class ReminderItem: NSManagedObject, Identifiable {
    @NSManaged public var title: String?
    @NSManaged public var isFlagged: Bool
    @NSManaged public var notes: String?
    @NSManaged public var url: URL?
    @NSManaged public var images: URL?
    
}

extension ReminderItem {
    static func getAllReminderItems() -> NSFetchRequest<ReminderItem> {
        let request: NSFetchRequest<ReminderItem> = ReminderItem.fetchRequest() as! NSFetchRequest<ReminderItem>
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
    func reminderViewModel() -> Reminder {
        Reminder(managedObject: self)
    }
    
}

// MARK: - Reminder Base Model
struct Reminder: Codable, Hashable, Remindable {
    
    
    // MARK: Properties
    let id: String
    var title: String
    var isFlagged: Bool
    var notes: String
    var url: URL?
    var images: URL?
    
    // MARK: Computed Properties
    var remindOnDate: Bool {
        // TODO: - Implement getter
        return false
    }
    
    var remindAtLocation: Bool {
        // TODO: - Implement getter
        return false
    }
    
    var remindWhenMessaging: Bool {
        // TODO: - Implement getter
        return false
    }
    
    // TODO: Why is this here? Move it somewhere else
    var filterCategory: ReminderFilterCategory {
        return .flagged
    }
    
    init(title: String, isFlagged: Bool, notes: String, url: URL?, images: URL?) {
        self.id = UUID().uuidString
        self.title = title
        self.isFlagged = isFlagged
        self.notes = notes
        self.url = url
        self.images = images
    }
    
    // MARK: Initializers
    init(managedObject: ReminderItem) {
        self.id = UUID().uuidString
        self.title = managedObject.title ?? "Untitled"
        self.isFlagged = managedObject.isFlagged
        self.notes = managedObject.notes ?? ""
        self.url = managedObject.url
        self.images = managedObject.images
    }
    
    
    static let `default`: Reminder = Reminder(title: "Debug Reminder", isFlagged: false, notes: "Debug default Reminder Type. Static property on Reminder struct.", url: nil, images: nil)
    
    
    
}


// MARK: - Reminder Type Extensions
extension Reminder {
   
    
}

enum ReminderFilterCategory: Int, CaseIterable {
    case today = 1, scheduled, flagged
    
    var name: String {
        switch self {
        case .today: return "Today"
        case .scheduled: return "Scheduled"
        case .flagged: return "Flagged"
        }
    }
    
    var sfSymbolImage: Image {
        switch self {
        case .today: return Image(systemName: "calendar")
        case .scheduled: return Image(systemName: "clock")
        case .flagged: return Image(systemName: "flag")
        }
    }
    
}
