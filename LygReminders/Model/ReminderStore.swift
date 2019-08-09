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

final class ReminderStore: ObservableObject {
    
    static let shared = ReminderStore()
    
    @Published var reminders: [Reminder] = []
    
}


