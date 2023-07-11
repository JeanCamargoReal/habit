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

                                Text("Copyright @YYY")
                                    .foregroundColor(.gray)
                                    .font(Font.system(size: 16).bold())
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
//        TextField("", text: $email)
//            .border(.black)
		EditTextView(text: $email,
					 placeholder: "E-mail",
					 keyboard: .emailAddress,
					 error: "e-mail inválido",
					 failure: email.count < 5)
    }
}

extension SignInView {
    var passwordField: some View {
        SecureField("", text: $password)
            .border(.orange)
    }
}

extension SignInView {
    var enterButton: some View {
        Button("Entrar") {
            viewModel.login(email: email, password: password)
        }
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
