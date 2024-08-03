//
//  HomeScreen.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
	@State var discreetMode: Bool = false
	@Environment(\.modelContext) var modelContext
	@Query(sort: \Record.creationDate, order: .reverse) var records: [Record]
	@State var addingRecordType: RecordType? = nil

	private var totalExpenses: Decimal {
		records.filter { $0.type == .expense || $0.type == .other }.map { $0.amount }.reduce(0, +)
	}

	@ViewBuilder
	private var buttonsView: some View {
		ScrollView(.horizontal) {
			HStack(spacing: 12) {
				InsertButton("Expense", systemImage: "scribble.variable") { addingRecordType = .expense }
				InsertButton("Income", systemImage: "sparkles") { addingRecordType = .income }
				InsertButton("Savings", systemImage: "shoeprints.fill") { addingRecordType = .savings }
				InsertButton("Other", systemImage: "shippingbox.fill") { addingRecordType = .other }
			}
			.padding(.horizontal, 20)
		}
		.scrollIndicators(.hidden)
	}

	@ViewBuilder
	private var headerView: some View {
		VStack {
			HeaderView(amount: totalExpenses, isDiscreet: $discreetMode)
				.padding(.horizontal, 20)

			buttonsView
		}
		.padding(.top)
		.padding(.bottom)
		.background(.colorHeader)
	}

	@ViewBuilder
	private var listView: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 30)
				.fill(.background)
				.frame(height: 100)
				.padding(.top, 76)
			RoundedRectangle(cornerRadius: 4)
				.frame(width: 47, height: 3)
		}
		.frame(height: 50)
		.frame(maxWidth: .infinity)
		.background(.colorHeader)

		List(records) { record in
			RecordView(record: record, isDiscreet: discreetMode)
				.swipeActions(edge: .trailing, allowsFullSwipe: true) {
					Button("Delete", systemImage: "trash", role: .destructive) {
						modelContext.delete(record)
					}
				}
		}
		.listStyle(.plain)
	}

	var body: some View {
		NavigationStack {
			VStack(spacing: 0) {
				headerView
				listView
			}
			.sheet(item: $addingRecordType) { recordType in
				AddRecordScreen(initialType: recordType)
			}
			.toolbar {
				ToolbarItem {
					Button("Notifications", systemImage: "bell") {}
				}
			}
		}
	}
}

#Preview {
	HomeScreen()
		.modelContainer(previewContainer)
}
