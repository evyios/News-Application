//
//  NotesView.swift
//  News App
//
//  Created by Evgeny on 21.11.23.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    
    // Grouper Notes (to split based on the day)
    @Query(sort: [
        SortDescriptor(\Notes.date, order: .reverse)
    ], animation: .snappy) private var allNotes: [Notes]
    
    @State private var groupedNotes: [GroupedNotes] = []
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Notes")
            .overlay {
                if allNotes.isEmpty || groupedNotes.isEmpty {
                    ContentUnavailableView {
                        Label("Make a note", systemImage: "pencil.and.scribble")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.green)
                    })
                }
            }
        }
    }
}

#Preview {
    NotesView()
}
