//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import Kingfisher

public struct JRestaurantCard: View {
	let image: URL
	let title: String
	let subtitle: String
	let rating: (Float, Int)
	
	init(image: URL, title: String, subtitle: String, rating: (Float, Int)) {
		self.image = image
		self.title = title
		self.subtitle = subtitle
		self.rating = rating
	}
	
	public var body: some View {
		VStack(alignment: .leading, spacing: DesignSystem.Spacings.default) {
			KFImage(image)
				.resizable()
				.frame(height: 200)
				.cornerRadius(DesignSystem.Radius.default)
				.overlay(
					RoundedRectangle(cornerRadius: DesignSystem.Radius.default)
						.stroke(DesignSystem.Colors.shadowBorder, lineWidth: 1)
				)
				.shadow(
					color: DesignSystem.Colors.shadow,
					radius: DesignSystem.Radius.default, x: 0, y: 4
				)
			
			VStack(alignment: .leading, spacing: DesignSystem.Spacings.small) {
				Text(title)
					.font(DesignSystem.Fonts.sectionTitle)
					.foregroundStyle(DesignSystem.Colors.textPrimary)
				
				Text(subtitle)
					.font(DesignSystem.Fonts.description)
					.foregroundStyle(DesignSystem.Colors.textSecondary)
				
				RatingView(rating: rating.0, count: rating.1)
			}
		}
		.background(DesignSystem.Colors.white)
		
		
		
	}
}

#Preview {
	Group {
		JRestaurantCard(
			image: URL(string: "https://picsum.photos/200/80")!,
			title: "Pizzaria Napoli",
			subtitle: "Pizza • Italiana",
			rating: (4.7, 1280)
		)
		.frame(width: 300)
	}
	.padding(12)
}
