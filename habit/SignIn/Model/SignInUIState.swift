//
//  SignInUIState.swift
//  habit
//
//  Created by Jean Camargo on 01/02/23.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
