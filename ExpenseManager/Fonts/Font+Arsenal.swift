//
//  Font+Arsenal.swift
//  ExpenseManager
//
//  Created by Heysem Katibi on 11.07.2024.
//

import SwiftUI

extension Font {
	static func arsenal(size: CGFloat, weight: Weight? = nil) -> Font {
		switch weight {
		case .some(.medium), .some(.semibold), .some(.bold), .some(.heavy), .some(.black):
			return .custom("ArsenalSC-Bold", size: size)

		default:
			return .custom("ArsenalSC-Regular", size: size)
		}
	}
}
