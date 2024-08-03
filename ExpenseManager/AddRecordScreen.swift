//
//  AddRecordScreen.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//


import SwiftUI

struct AddRecordScreen: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var modelContext

	let initialType: RecordType

	@State var title: String = ""
	@State var type: RecordType? = nil
	@State var date: Date = .now
	@State var amount: String = ""

	@State var invalidTitle: Bool = false
	@State var invalidAmount: Bool = false

	private var typeBinding: Binding<RecordType> {
		Binding<RecordType> {
			type ?? initialType
		} set: {
			type = $0
		}
	}


	@ToolbarContentBuilder
	private var toolbarContent: some ToolbarContent {
		ToolbarItem(placement: .confirmationAction) {
			Button("Save") {
				guard !title.isEmpty else {
					invalidTitle = true
					return
				}
				guard let parsedAmount = Decimal(string: amount) else {
					invalidAmount = true
					return
				}

				let record = Record(title: title, type: typeBinding.wrappedValue, amount: parsedAmount, creationDate: date)
				modelContext.insert(record)
				dismiss()
			}
		}

		ToolbarItem(placement: .cancellationAction) {
			Button("Close", role: .cancel) {
				dismiss()
			}
		}
	}

	var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Title", text: $title)
						.font(.system(size: 26))
						.padding(.vertical, 4)
				}

				Section {
					Picker("Type", selection: typeBinding) {
						Text("Expense").tag(RecordType.expense)
						Text("Income").tag(RecordType.income)
						Text("Savings").tag(RecordType.savings)
						Text("Other").tag(RecordType.other)
					}

					DatePicker("Date", selection: $date)
				}

				Section {
					TextField("Amount", text: $amount)
						.keyboardType(.decimalPad)
						.font(.arsenal(size: 21))
						.padding(.vertical, 5)
				}
			}
			.toolbar { toolbarContent }
			.navigationTitle("Add Record")
			.alert("The title is required", isPresented: $invalidTitle) {
				Button("OK") {}
			}
			.alert("The amount you provided is invalid", isPresented: $invalidAmount) {
				Button("OK") {}
			}
		}
	}
}

#Preview {
	NavigationStack {
		Color.black
			.sheet(isPresented: .constant(true)) {
				AddRecordScreen(initialType: .income)
			}
	}
}
