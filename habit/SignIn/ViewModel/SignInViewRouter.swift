//
//  SignInViewRouter.swift
//  habit
//
//  Created by Jean Camargo on 03/02/23.
//

import SwiftUI
import Combine

enum SignInViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()

        return HomeView(viewModel: viewModel)
    }

    static func makeSignUpView(publisher: PassthroughSubject<Bool, Never>) -> some View {
        let viewModel = SignUpViewModel()

		viewModel.publisher = publisher


        return SignUpView(viewModel: viewModel)
    }
}
