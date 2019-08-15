//
//  ContentView.swift
//  LygReminders
//
//  Created by Hugh Broome on 8/9/19.
//  Copyright © 2019 Lygre Tech. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: - Reminders Home View

struct RemindersHomeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ReminderItem.getAllReminderItems()) var reminderItems: FetchedResults<ReminderItem>
    // MARK: Constants & Properties
    
    @State private var searchQueryText = ""
    
    @State private var detailCardDisplayed: Bool = true
    
    //MARK: View Body
    var body: some View {
        NavigationView {
            ScrollView([.vertical]) {
                VStack {
                    Section(header: ReminderSearchBarView(searchQueryText: $searchQueryText)) {
                        // MARK: - Category Filter Panel
                        // TODO: Make panel and implement
                        Button(
                            action: {
                                withAnimation(.interpolatingSpring(stiffness: 300.0, damping: 30.0)) {
                                    self.detailCardDisplayed.toggle()
                                }
                        },
                            label: { ZStack(alignment: .center) {
                                
                                RoundedRectangle(cornerRadius: 8).fill(Color.gray)
                                    .padding([.leading, .trailing], 50)
                                
                                Text("Placeholder")
                                    .padding(.vertical, 5)
                                
                                }
                            }
                        )
                        
                    }
                    
                    Section {
                        GeometryReader { proxy in
                        ZStack(alignment: .center) {
                            if self.detailCardDisplayed {
                                RoundedRectangle(cornerRadius: 8).fill(Color.blue)
                                    .padding([.leading, .trailing], proxy.size.width / 10)
                                    .frame(height: proxy.size.width)
                            
                                Text("DetailCardPLaceholder")
                            }
                        }
                        .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        .transition(.slide)
                            
                            
                        }
                    }
                }
                    
                    // MARK: Spacer End Of VStack
//                    Spacer()
                    
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            }
            
        }
    }


#if DEBUG
struct RemindersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersHomeView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}
#endif


