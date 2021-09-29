//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Zhao Qianyu on 29/9/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
