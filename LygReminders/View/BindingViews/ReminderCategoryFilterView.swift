//
//  ReminderCategoryFilterView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct ReminderCategoryFilterView: View {
    @EnvironmentObject private var reminderStore: ReminderStore
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle().fill(Color.blue)
                    .overlay(Image(systemName: "pencil").blendMode(.destinationOut)
                        .imageScale(.medium))
                        
                Spacer()
                
                VStack {
                    Text("\(reminderStore.reminders.count)")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Spacer()
                }
            }
        
            Text("Hi")
            
        }
        .padding(.all, 5)
        .background(Color.gray)
        .cornerRadius(15)
    }
}

#if DEBUG
struct ReminderCategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCategoryFilterView()
            .environmentObject(ReminderStore.shared)
            .frame(width: 140, height: 60)
    }
}
#endif
