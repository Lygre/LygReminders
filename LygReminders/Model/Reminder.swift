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
        let sortDescriptor = NSSortDescriptor(key: "", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

// MARK: - Reminder Base Model
struct Reminder: Codable, Remindable {
    
    
    // MARK: Properties
    let id: String
    var title: String
    var isFlagged: Bool
    var notes: String
    var url: URL?
    var images: [URL]
    
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
    
    var filterCategory: ReminderFilterCategory {
        return .flagged
    }
    
    static let `default`: Reminder = Reminder(id: UUID().uuidString, title: "Debug Reminder", isFlagged: false, notes: "Debug default Reminder Type. Static property on Reminder struct.", url: nil, images: [])
    
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
