//
//  SignInView.swift
//  habit
//
//  Created by Jean Camargo on 25/01/23.
//

import SwiftUI

struct SignInView: View {

    @ObservedObject var viewModel: SignInViewModel

    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true

    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView(showsIndicators: false) {
                        VStack (alignment: .center, spacing: 20) {
                            Spacer(minLength: 36)

                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)

                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)

                                emailField

                                passwordField

                                enterButton

                                registerLink

                                Text("Copyright - Athena LTDA 2023")
                                    .foregroundColor(.gray)
                                    .font(Font.system(size: 13).bold())
                                    .padding(.top, 16)

                            }
                        }

                        if case SignInUIState.error(let value) = viewModel.uiState {
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")) {
                                        // faz algo quando some o alerta
                                    })
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(navigationHidden)
                }
                .onAppear {
                    self.navigationHidden = true
                }
                .onDisappear {
                    self.navigationHidden = false
                }
            }
        }
    }
}

extension SignInView {
    var emailField: some View {
		EditTextView(text: $email,
					 placeholder: "E-mail",
					 keyboard: .emailAddress,
					 error: "e-mail inválido",
					 failure: !email.isEmail())
    }
}

extension SignInView {
	var passwordField: some View {
		EditTextView(text: $password,
					 placeholder: "Senha",
					 keyboard: .emailAddress,
					 error: "senha deve ter ao menos 8 caracteres",
					 failure: password.count < 8,
					 isSecure: true)
	}
}

extension SignInView {
    var enterButton: some View {
		LoadingButtonView(action: {
			viewModel.login(email: email, password: password)
		},
						  text: "Entrar",
						  showProgress: self.viewModel.uiState == SignInUIState.loading,
						  disabled: !email.isEmail() || password.count < 8)
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui um login ativo?")
                .foregroundColor(.gray)
                .padding(.top, 48)

            ZStack {
                NavigationLink(destination: viewModel.signUpView(),
                               tag: 1,
                               selection: $action,
                               label: { EmptyView()})

                Button("Realize seu cadastro") {
                    self.action = 1
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			let viewModel = SignInViewModel()

			SignInView(viewModel: viewModel)
				.previewDevice("iPhone 14 Pro")
				.preferredColorScheme($0)
		}
    }
}
