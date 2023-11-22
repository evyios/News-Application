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
}
   
