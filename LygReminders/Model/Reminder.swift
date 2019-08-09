//
//  Reminder.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/8/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import Foundation
import SwiftUI

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
    
    enum ReminderFilterCategory: Int, CaseIterable {
        case today = 1, scheduled, flagged
    }
    
    var filterCategory: ReminderFilterCategory {
        return .flagged
    }
    
    static let `default`: Reminder = Reminder(id: UUID().uuidString, title: "Debug Reminder", isFlagged: false, notes: "Debug default Reminder Type. Static property on Reminder struct.", url: nil, images: [])
    
}
