//
//  ContentView.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			HomeScreen()
				.tabItem { Label("Home", systemImage: "house.fill") }

			Color.purple
				.tabItem { Label("Analytics", systemImage: "chart.pie.fill") }

			Color.green
				.tabItem { Label("Profile", systemImage: "person") }
		}
	}
}

#Preview {
	ContentView()
}
