//
//  IshopApp.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/04/2021.
//

import SwiftUI

@main
struct IshopApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var mainObject = MainViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mainObject)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
