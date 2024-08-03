//
//  Record.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import Foundation
import SwiftData

@Model
class Record {
	let title: String
	let type: RecordType
	let amount: Decimal
	let creationDate: Date

	init(title: String, type: RecordType, amount: Decimal, creationDate: Date) {
		self.title = title
		self.type = type
		self.amount = amount
		self.creationDate = creationDate
	}
}

extension Record: Identifiable {}

extension Record: Hashable {
	static func == (lhs: Record, rhs: Record) -> Bool {
		lhs.title == rhs.title &&
		lhs.type == rhs.type &&
		lhs.amount == rhs.amount &&
		lhs.creationDate == rhs.creationDate
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(title)
		hasher.combine(type)
		hasher.combine(amount)
		hasher.combine(creationDate)
	}
}

extension Record {
	var adjustedAmount: Decimal {
		switch type {
		case .expense, .other: return -amount
		case .income, .savings: return amount
		}
	}
}
