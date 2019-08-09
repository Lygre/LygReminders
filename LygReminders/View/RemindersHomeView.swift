//
//  ContentView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

struct RemindersHomeView: View {
    
    @State private var searchQueryText = ""
    
    var body: some View {
        NavigationView {
            HStack {
                Text("Placeholder")
                
            }
            .navigationBarItems(trailing:
                ReminderSearchBarView(searchQueryText: $searchQueryText)
            )
        }
    }
}

#if DEBUG
struct RemindersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersHomeView()
    }
}
#endif


