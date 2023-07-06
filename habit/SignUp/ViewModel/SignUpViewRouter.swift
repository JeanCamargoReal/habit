//
//  SignUpViewRouter.swift
//  habit
//
//  Created by Jean Camargo on 06/02/23.
//

import SwiftUI

enum SignUpViewRouter {

	static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
		
        return HomeView(viewModel: viewModel)
    }
}
