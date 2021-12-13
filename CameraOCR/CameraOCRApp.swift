//
//  CameraOCRApp.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 14/12/2021.
//

import SwiftUI

@main
struct CameraOCRApp: App{
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Mainview()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            MatchedGeo()
                
        }
    }
}
