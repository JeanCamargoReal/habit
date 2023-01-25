//
//  HabitApp.swift
//  habit
//
//  Created by Jean Camargo on 21/12/22.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
