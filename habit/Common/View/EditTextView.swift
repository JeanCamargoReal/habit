//
//  EditTextView.swift
//  habit
//
//  Created by Jean Camargo on 10/07/23.
//

import SwiftUI

struct EditTextView: View {
	@Binding var text: String

	var placeholder: String = ""
	var keyboard: UIKeyboardType = .default
	var error: String? = nil
	var failure: Bool? = nil


	var body: some View {
		VStack {
			TextField(placeholder, text: $text)
				.foregroundColor(Color("textColor"))
				.keyboardType(keyboard)
				.textFieldStyle(CustomTextFieldStyle())


			if let error = error, failure == true, !text.isEmpty {
				Text(error).foregroundColor(.red)
			}
		}
		.padding(.bottom, 10)
	}
}

struct EditTextView_Previews: PreviewProvider {
	static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			VStack {
				EditTextView(text: .constant(""),
							 placeholder: "E-mail",
							 error: "Campo inváldio",
							 failure: "a@a.com".count < 3)
					.padding()
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.previewDevice("iPhone 14 Pro")
			.preferredColorScheme($0)
		}
	}
}
