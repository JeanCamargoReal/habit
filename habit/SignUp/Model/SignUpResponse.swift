//
//  SignUpResponse.swift
//  habit
//
//  Created by Jean Camargo on 26/07/23.
//

import Foundation


struct SignUpResponse: Decodable {
	let detail: String?

	enum CodingKeys: String, CodingKey {
		case detail
	}
 }
