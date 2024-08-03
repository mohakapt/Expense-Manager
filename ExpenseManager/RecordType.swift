//
//  RecordType.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import Foundation

enum RecordType: Codable {
	case expense
	case income
	case savings
	case other
}

extension RecordType: Identifiable {
	var id: Int {
		switch self {
		case .expense: return 101
		case .income: return 102
		case .savings: return 103
		case .other: return 104
		}
	}
}
