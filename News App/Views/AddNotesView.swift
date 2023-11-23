//
//  AddNotesView.swift
//  News App
//
//  Created by Evgeny on 22.11.23.
//

import SwiftUI
import SwiftData

struct AddNotesView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var noteText: String = ""
    @State private var date: Date = .init()
    @State private var isImportant: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("Order food", text: $title)
                }
                
                Section("Description") {
                    TextField("Write a note text here...", text: $noteText)
                }
                
                Section("Priority") {
                    Toggle("ASAP", isOn: $isImportant)
                }
                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
            }
            .navigationTitle("Add Note")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        addNote()
                    }
                }
            }
        }
    }
    /// Adding Note to the Swift Data
    func addNote() {
        
    }
}

#Preview {
    AddNotesView()
}
