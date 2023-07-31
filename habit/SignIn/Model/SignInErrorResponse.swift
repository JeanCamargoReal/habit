//
//  SignInErrorResponse.swift
//  habit
//
//  Created by Jean Camargo on 31/07/23.
//

import Foundation

struct SignInErrorResponse: Decodable {
	let detail: SignInDetailErrorResponse

	enum CodingKeys: String, CodingKey {
		case detail
	}
}

struct SignInDetailErrorResponse: Decodable {
	let message: String

	enum CodingKeys: String, CodingKey {
		case message
	}
}
