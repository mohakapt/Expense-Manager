//
//  InsertButton.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

struct InsertLabelStyle: LabelStyle {
	func makeBody(configuration: Configuration) -> some View {
		VStack(spacing: 10) {
			configuration.icon
				.font(.system(size: 30))
			configuration.title
				.font(.system(size: 14))
		}
		.padding()
		.frame(minWidth: 92, minHeight: 112)
	}
}

struct InsertButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.background(.accent)
			.foregroundStyle(.colorSecondaryText)
			.clipShape(RoundedRectangle(cornerRadius: 20))
			.scaleEffect(configuration.isPressed ? 0.95 : 1)
			.opacity(configuration.isPressed ? 0.75 : 1)
	}
}

struct InsertButton: View {
	private let title: LocalizedStringKey
	private let systemImage: String
	private let action: () -> Void

	init(_ title: LocalizedStringKey, systemImage: String, action: @escaping () -> Void) {
		self.title = title
		self.systemImage = systemImage
		self.action = action
	}

	var body: some View {
		Button(action: action) {
			Label(title, systemImage: systemImage)
				.labelStyle(InsertLabelStyle())
		}
		.buttonStyle(InsertButtonStyle())
	}
}
