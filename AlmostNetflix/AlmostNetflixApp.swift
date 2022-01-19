//
//  AppwriteFlixApp.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 20/12/2021.
//

import SwiftUI

@main
struct AlmostNetflixApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(AuthVM.shared)
        }
    }
}
