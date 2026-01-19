//
//  thebeansApp.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import SwiftUI
import UIKit

@main
struct thebeansApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
