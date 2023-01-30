//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Library())
        }
    }
}
