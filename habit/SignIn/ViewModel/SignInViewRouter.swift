//
//  SignInViewRouter.swift
//  habit
//
//  Created by Jean Camargo on 03/02/23.
//

import SwiftUI

enum SignInViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()

        return HomeView(viewModel: viewModel)
    }
}