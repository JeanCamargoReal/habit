//
//  SignInInteractor.swift
//  habit
//
//  Created by Jean Paulo Marcel Henrique de Camargo on 01/09/23.
//

import Foundation

class SignInInteractor {
    private let remote: RemoteDataSource = .shared
//    private let local: LocalDataSource
}

extension SignInInteractor {
    func login(loginRequest request: SignInRequest, completion: @escaping (SignInResponse?, SignInErrorResponse?) -> Void) {
        remote.login(request: request, completion: completion)
    }
}
