//
//  ExpenseManagerApp.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI
import SwiftData

@main
struct ExpenseManagerApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.modelContainer(for: Record.self)
	}
}
