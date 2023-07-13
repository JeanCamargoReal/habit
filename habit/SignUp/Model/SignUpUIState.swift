//
//  SignUpUIState.swift
//  habit
//
//  Created by Jean Camargo on 06/02/23.
//

import Foundation


enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
