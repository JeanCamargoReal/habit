//
//  SplashViewRouter.swift
//  habit
//
//  Created by Jean Camargo on 25/01/23.
//

import SwiftUI

enum SplashViewRouter {
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel(interactor: SignInInteractor())

        return SignInView(viewModel: viewModel)
    }
}
