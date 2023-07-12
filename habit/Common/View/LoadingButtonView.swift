//
//  LoadingButtonView.swift
//  habit
//
//  Created by Jean Camargo on 12/07/23.
//

import SwiftUI

struct LoadingButtonView: View {

	var action: () -> Void
	var text: String
	var showProgress: Bool = false
	var disabled: Bool = false

	var body: some View {
		ZStack {
			VStack {
				Button {
					action()
				} label: {
					Text(showProgress ? " " : text)
						.frame(maxWidth: .infinity)
						.padding(.vertical, 14)
						.padding(.horizontal, 16)
						.font(Font.system(.title3).bold())
						.background(disabled ? Color("lightOrange") : Color.orange)
						.foregroundColor(.white)
						.cornerRadius(4)
				}
				.disabled(disabled || showProgress)
			}
			.padding()

			ProgressView()
				.progressViewStyle(CircularProgressViewStyle())
				.opacity(showProgress ? 1 : 0)
		}
	}
}

struct LoadingButtonView_Previews: PreviewProvider {
	static var previews: some View {
		LoadingButtonView(action: {
			print("Olá Mundo!")
		}, text: "Entrar", showProgress: false, disabled: false)
	}
}
