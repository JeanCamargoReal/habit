//
//  SignInViewModel.swift
//  habit
//
//  Created by Jean Camargo on 25/01/23.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var uiState: SignInUIState = .none

    func login(email: String, password: String) {
        self.uiState = .loading

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .goToHomeScreen
        }
    }
}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
}
