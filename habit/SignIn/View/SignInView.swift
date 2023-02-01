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
                Text("tela principal")
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

                                numberField

                                passwordField

                                enterButton

                                registerLink

                                Text("Copyright @YYY")
                                    .foregroundColor(.gray)
                                    .font(Font.system(size: 16).bold())
                                    .padding(.top, 16)

                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .background(Color.white)
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
    var numberField: some View {
        TextField("", text: $email)
            .border(.black)
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
                NavigationLink(destination: Text("Tela de cadastro"), tag: 1, selection: $action, label: { EmptyView()})

                Button("Realize seu cadastro") {
                    self.action = 1
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
