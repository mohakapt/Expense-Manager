//
//  RecordView.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

struct RecordView: View {
	let record: Record
	let isDiscreet: Bool

	private var iconSystemName: String {
		switch record.type {
		case .expense: return "scribble.variable"
		case .income: return "sparkles"
		case .savings: return "shoeprints.fill"
		case .other: return "shippingbox.fill"
		}
	}

	@ViewBuilder
	private var iconView: some View {
		Image(systemName: iconSystemName)
			.font(.system(size: 22))
			.foregroundStyle(.white)
			.padding(11)
			.background(Circle().fill(.accent.opacity(0.7)))
	}

	@ViewBuilder
	private var textView: some View {
		let dateFormatted = "\(record.creationDate.formatted(.dateTime.month().day())) - \(record.creationDate.formatted(.dateTime.hour().minute()))"

		VStack(alignment: .leading, spacing: 4) {
			Text(record.title)
				.foregroundStyle(.colorText)
				.font(.system(size: 18, weight: .medium))

			Text(dateFormatted)
				.foregroundStyle(.colorText.opacity(0.6))
				.font(.system(size: 14))
		}
	}

	@ViewBuilder
	private var amountView: some View {
		let amountFormatted = isDiscreet ? "***.**" : record.adjustedAmount.formatted(.number.precision(.fractionLength(2)))

		Text(amountFormatted)
			.font(.arsenal(size: 20, weight: .bold))
			.foregroundStyle(record.adjustedAmount < 0 ? .colorCredit : .colorDebit)
	}

	var body: some View {
		HStack(spacing: 16) {
			iconView
			textView
			Spacer()
			amountView
		}
	}
}
