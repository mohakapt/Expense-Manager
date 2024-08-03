//
//  PreviewContainer.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
	do {
		let container = try ModelContainer(for: Record.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

		container.mainContext.insert(Record(
			title: "Transportation",
			type: .expense,
			amount: 34.49,
			creationDate: Date().addingTimeInterval(-20)
		))
		container.mainContext.insert(Record(
			title: "Investment",
			type: .income,
			amount: 428.5,
			creationDate: Date().addingTimeInterval(60 * 60 * -20)
		))
		container.mainContext.insert(Record(
			title: "Insurance",
			type: .expense,
			amount: 144.99,
			creationDate: Date().addingTimeInterval(2 * 60 * 60 * -20)
		))
		container.mainContext.insert(Record(
			title: "Food",
			type: .expense,
			amount: 95,
			creationDate: Date().addingTimeInterval(5 * 60 * 60 * -20)
		))
		container.mainContext.insert(Record(
			title: "Utilities",
			type: .expense,
			amount: 254,
			creationDate: Date().addingTimeInterval(8 * 60 * 60 * -20)
		))
		container.mainContext.insert(Record(
			title: "Freelancing",
			type: .income,
			amount: 800,
			creationDate: Date().addingTimeInterval(20 * 60 * 60 * -20)
		))

		return container
	} catch {
		fatalError("Unable to create the container")
	}
}()
