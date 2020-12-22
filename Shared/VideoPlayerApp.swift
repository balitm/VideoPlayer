//
//  VideoPlayerApp.swift
//  Shared
//
//  Created by Balázs Kilvády on 18/12/2020.
//

import SwiftUI

@main
struct VideoPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(UrlViewModel())
        }
    }
}
