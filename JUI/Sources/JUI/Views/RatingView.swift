//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct RatingView: View {
	private let rating: Float
	private let count: Int

	public init(rating: Float, count: Int) {
		self.rating = rating
		self.count = count
	}

	public var body: some View {
		HStack(spacing: DesignSystem.Spacings.small) {
			Text(rating.description)
				.font(DesignSystem.Fonts.default)
				.foregroundStyle(DesignSystem.Colors.textPrimary)

			LocalImage(named: DesignSystem.Assets.star)
				.frame(width: 12, height: 12)

			Text("(\(count.description))")
				.font(DesignSystem.Fonts.default)
				.foregroundStyle(DesignSystem.Colors.textSecondary)
		}
	}
}

#Preview {
	RatingView(rating: 4.4, count: 2000)
	RatingView(rating: 2.4, count: 2)
	RatingView(rating: 1.33, count: 123)
}
