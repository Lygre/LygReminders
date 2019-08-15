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
    
    var category: ReminderFilterCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color.blue)
                    .overlay(
                        category.sfSymbolImage
                            .foregroundColor(.white)
                            .imageScale(.medium)
                )
                        
                Spacer()
                
                VStack {
                    Text("\(reminderStore.reminders.count)")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Spacer()
                }
            }
        
            Text(category.name)
                .font(.system(size: 15, weight: .bold, design: .rounded))
        }
        .padding(.all, 5)
        .background(Color.gray)
        .cornerRadius(15)
    }
}

#if DEBUG
struct ReminderCategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCategoryFilterView(category: .scheduled)
            .environmentObject(ReminderStore.shared)
            .frame(width: 140, height: 60)
    }
}
#endif
