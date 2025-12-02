//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import Kingfisher

public struct RestaurantCard: View {
	private let image: URL?
	private let title: String
	private let subtitle: String
	private let rating: (Float, Int)
	
	public init(image: URL? = nil, title: String, subtitle: String, rating: (Float, Int)) {
		self.image = image
		self.title = title
		self.subtitle = subtitle
		self.rating = rating
	}
	
	public init(data: any RestaurantProtocol) {
		self.init(
			image: data.imageUrl,
			title: data.name,
			subtitle: data.description,
			rating: (data.rating, data.numberOfRatings)
		)
	}
	
	public var body: some View {
		VStack(alignment: .leading, spacing: DesignSystem.Spacings.default) {
			KFImage(image)
				.resizable()
				.cacheMemoryOnly()
				.memoryCacheExpiration(.seconds(300))
				.frame(height: 200)
				.cornerRadius(DesignSystem.Radius.default)
				.overlay(
					LinearGradient(
						gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
						startPoint: .bottom,
						endPoint: .top
					)
					.frame(height: 100)
					.cornerRadius(DesignSystem.Radius.default),
					alignment: .bottom
				)
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
		.background(DesignSystem.Colors.background)
	}
}

#Preview("Nome longo") {
	RestaurantCard(
		image: URL(string: "https://picsum.photos/200/80")!,
		title: "Pizzaria Napoli com um nome muito grande",
		subtitle: "Pizza • Italiana",
		rating: (2.3, 12)
	)
	.frame(width: 300)
}
