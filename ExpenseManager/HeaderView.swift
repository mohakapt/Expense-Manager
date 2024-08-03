//
//  HeaderView.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

struct HeaderView: View {
	let amount: Decimal
	@Binding var isDiscreet: Bool

	var amountFormatted: String {
		isDiscreet ? "****.**" : amount.formatted(.number.precision(.fractionLength(2)))
	}

	@ViewBuilder
	private var titleView: some View {
		Text("Current expenses")
			.font(.system(size: 19))
			.foregroundStyle(.colorText)
	}

	@ViewBuilder
	private var expenseView: some View {
		Group {
			Text("$")
				.font(.arsenal(size: 40, weight: .bold)) +
			Text(" ") +
			Text(amountFormatted)
				.font(.arsenal(size: 50, weight: .bold))
		}
		.italic()
		.foregroundStyle(.colorText)
	}

	var body: some View {
		VStack(alignment: .leading) {
			titleView

			HStack {
				expenseView
				Spacer()
				DiscreetToggle(isDiscreet: $isDiscreet)
			}
		}
	}
}
