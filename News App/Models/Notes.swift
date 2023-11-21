//
//  Notes.swift
//  News App
//
//  Created by Evgeny on 21.11.23.
//

import SwiftUI
import SwiftData


@Model
class Notes {
    var title: String
    var noteText: String
    var date: Date
    
    init(title: String, noteText: String, date: Date) {
        self.title = title
        self.noteText = noteText
        self.date = date
    }
}
