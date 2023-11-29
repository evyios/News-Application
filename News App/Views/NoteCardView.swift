//
//  NoteCardView.swift
//  News App
//
//  Created by Evgeny on 27.11.23.
//

import SwiftUI

struct NoteCardView: View {
    
   @Bindable var notes: Notes
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(notes.title)
                
                Text(notes.noteText)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(2)
            
            Spacer(minLength: 5)
            
            Image(systemName: notes.isImportant ? "bolt.trianglebadge.exclamationmark.fill" : "bolt.trianglebadge.exclamationmark.fill")
        }
    }
}
