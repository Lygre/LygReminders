//
//  ReminderSearchBarView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI

// MARK: ReminderSearchBarView
/// Contains the Binding search bar text field used to filter reminders
struct ReminderSearchBarView: View {
    @Binding var searchQueryText: String
    
    
    // MARK: - Content View Struct
    /// private Content View struct
    fileprivate struct Content: View {
        @State private var searchActive: Bool = false
        
        @Binding var searchQueryText: String
        
        var body: some View {
                ZStack(alignment: .center) {
                    
                    HStack(spacing: 5) {
                        
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 8)
                        
                        TextField("Search",
                                  text: self.$searchQueryText,
                                  onEditingChanged: { (changedFromInitValue) in
                                    if changedFromInitValue {
                                        self.searchActive = true
                                    } },
                                  onCommit: {
                                    if self.searchQueryText.isEmpty { self.searchActive = false } }
                        )
                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    
                    HStack(alignment: .center) {
                        
                        Spacer()
                        
                        Button(
                            action: {
                                // TODO: Dictation button action implementation
                        },
                            label: {
                                Image(systemName: "mic.fill")
                        })
                            .padding(.trailing, 8)
                        
                    }
                    
                }
                .padding([.top, .bottom], 8)
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(Color.white, lineWidth: 1))
                .padding(.all, 15)
                .background(Color.gray)
            
        }
            
        
    }
    
    var body: some View {
        Content(searchQueryText: $searchQueryText)
    }
    
}

#if DEBUG
struct ReminderSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSearchBarView(searchQueryText: .constant(""))
            .frame(height: 60)
    }
}
#endif
