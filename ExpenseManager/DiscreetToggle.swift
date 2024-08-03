//
//  DiscreetToggle.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

struct DiscreetToggle: View {
	@Binding var isDiscreet: Bool

	var body: some View {
		Button {
			isDiscreet.toggle()
		} label: {
			Image(systemName: isDiscreet ? "eye.slash.fill" : "eye.fill")
				.imageScale(.large)
				.foregroundStyle(.accent.opacity(0.7))
		}
	}
}
