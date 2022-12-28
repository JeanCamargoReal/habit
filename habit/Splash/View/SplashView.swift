//
//  SplashView.swift
//  habit
//
//  Created by Jean Camargo on 27/12/22.
//

import SwiftUI

struct SplashView: View {

    @State var state: SplashUIState = .loading

    var body: some View {
        switch state {
        case .loading:
            loadingView()
        case .goToSignInScreen:
            Text("carregar tela de login")
        case .goToHomeScreen:
            Text("carregar tela de home")
        case .error(let msg):
            Text("mostrar erro: \(msg)")
        }
    }
}

extension SplashView {
    func loadingView() -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
