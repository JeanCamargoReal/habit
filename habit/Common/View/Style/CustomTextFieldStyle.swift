//
//  CustomTextFieldStyle.swift
//  habit
//
//  Created by Jean Camargo on 11/07/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
	public func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(.horizontal, 8)
			.padding(.vertical, 16)
			.overlay(RoundedRectangle(cornerRadius: 8).stroke(.orange, lineWidth: 0.8))
	}
}
