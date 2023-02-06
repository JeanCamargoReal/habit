//
//  SignUpViewModel.swift
//  habit
//
//  Created by Jean Camargo on 06/02/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var uiState: SignUpUIState = .none

    func signUp() {
        self.uiState = .loading

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .error("Usuário já existente")
//            self.uiState = .goToHomeScreen
        }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
