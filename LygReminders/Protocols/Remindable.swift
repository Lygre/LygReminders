//
//  Remindable.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/8/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import Foundation

protocol Remindable: Identifiable {
    
    // MARK: - Read-Write Properties
    var title: String { get set }
    
    var notes: String { get set }
    
    var url: URL? { get set }
    
    // MARK: - Read-Only Properties
    var remindOnDate: Bool { get }
    
    var remindAtLocation: Bool { get }
  
    var remindWhenMessaging: Bool { get }

}
