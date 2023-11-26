//
//  GroupedNote.swift
//  News App
//
//  Created by Evgeny on 22.11.23.
//

import SwiftUI

struct GroupedNotes: Identifiable {
    var id: UUID = .init()
    var date: Date
    var notes: [Notes]
    
    var groupedTitle: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
}
   
