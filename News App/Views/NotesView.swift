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
    @State private var addNotes: Bool = false
    
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
                    Button(action: {
                        addNotes.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.green)
                    })
                }
            }
        }
        .onChange(of: allNotes, initial: true) { oldValue, newValue in
            if groupedNotes.isEmpty {
                createGroupedNotes(newValue)
            }
        }
        .sheet(isPresented: $addNotes) {
            AddNotesView()
        }
    }
    
    ///  Grouping notes by date
    func createGroupedNotes(_ notes: [Notes]) {
        Task.detached(priority: .high) {
            let groupedDict = Dictionary(grouping: notes) { note in
                let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: note.date)
                
                return dateComponents
            }
            
            let sortedDict = groupedDict.sorted {
                let calendar = Calendar.current
                let date1 = calendar.date(from: $0.key) ?? .init()
                let date2 = calendar.date(from: $1.key) ?? .init()
                
                return calendar.compare(date1, to: date2, toGranularity: .day) == .orderedDescending
            }
            
            /// Adding to the grouped array and updating on the main thread
            await MainActor.run {
                groupedNotes = sortedDict.compactMap({ dict in
                    let date = Calendar.current.date(from: dict.key) ?? .init()
                    return .init(date: date, notes: dict.value)
                })
            }
        }
    }
}

#Preview {
    NotesView()
}
