//
//  ErrorResponse.swift
//  habit
//
//  Created by Jean Camargo on 26/07/23.
//

import Foundation

struct ErrorResponse: Decodable {
	let detail: String

	enum CodingKeys: String, CodingKey {
		case detail
	}
	}
