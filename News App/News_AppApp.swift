//
//  News_AppApp.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import SwiftUI

@main
struct News_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .toolbar(.hidden)
            }
        }
        .modelContainer(for: Notes.self)
    }
}
