//
//  SignInRequest.swift
//  habit
//
//  Created by Jean Camargo on 28/07/23.
//

import Foundation

struct SignInRequest: Encodable {
	let email: String
	let password: String
}
