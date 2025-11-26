//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct RestaurantDetailView: View {
	@ObservedObject private var viewModel: RestaurantDetailViewModel
	
	init(viewModel: RestaurantDetailViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		Group {
			switch viewModel.state {
			case .loading:
				loadingView
					.frame(maxWidth: .infinity, maxHeight: .infinity)
			case .error:
				errorView
					.frame(maxWidth: .infinity, maxHeight: .infinity)
			case let .loaded(restaurant):
				contentView(restaurant: restaurant)
			}
		}
		.onFirstAppear { viewModel.loadContent() }
		.background(DesignSystem.Colors.background)
	}
	
	// MARK: States
	private var errorView: some View { Text("Error") }
	private var loadingView: some View { Loading() }
	private func contentView(restaurant: RestaurantData) -> some View {
		ScrollView(.vertical) {
			headerView(restaurant)
			if let dishes = restaurant.dishes { menuView(dishes) }
		}
	}
	
	// MARK: Sections
	private func headerView(_ restaurant: RestaurantData) -> some View {
		VStack(alignment: .center, spacing: DesignSystem.Spacings.default) {
			JImage(restaurant.imageUrl)
				.frame(height: 220)
			
			VStack(alignment: .center, spacing: DesignSystem.Spacings.small) {
				Text(restaurant.name)
					.font(DesignSystem.Fonts.title)
					.foregroundStyle(DesignSystem.Colors.textPrimary)
				
				RatingView(rating: restaurant.rating, count: restaurant.numberOfRatings)
			}

			HStack {
				VStack(alignment: .center, spacing: DesignSystem.Spacings.small) {
					Text(Strings.deliveryPrice)
						.font(DesignSystem.Fonts.default)
						.foregroundStyle(DesignSystem.Colors.textSecondary)
					
					Text(restaurant.deliveryPrice.asString)
						.font(DesignSystem.Fonts.default)
						.foregroundStyle(DesignSystem.Colors.textTertiary)
				}
				
				Rectangle()
					.frame(width: 1)
					.foregroundColor(DesignSystem.Colors.separator)
				
				VStack(alignment: .center, spacing: DesignSystem.Spacings.small) {
					Text(Strings.deliveryTime)
						.font(DesignSystem.Fonts.default)
						.foregroundStyle(DesignSystem.Colors.textSecondary)
					
					Text(restaurant.eta)
						.font(DesignSystem.Fonts.default)
						.foregroundStyle(DesignSystem.Colors.textTertiary)
				}
			}
			.padding(.vertical, DesignSystem.Spacings.margin)
			.frame(maxWidth: .infinity)
			.background(
				RoundedRectangle(cornerRadius: DesignSystem.Radius.default)
					.fill(DesignSystem.Colors.background)
					.shadow(color: DesignSystem.Colors.darkGray.opacity(0.1), radius: 4)
					.overlay(
						RoundedRectangle(cornerRadius: DesignSystem.Radius.default)
							.stroke(DesignSystem.Colors.lightGray.opacity(0.3), lineWidth: 1)
					)
			)
			.padding(.horizontal, DesignSystem.Spacings.margin)
		}
	}
	
	private func menuView(_ dishes: [DishData]) -> some View {
		JSectionView(Strings.dishes) {
			LazyVStack(alignment: .leading, spacing: DesignSystem.Spacings.default) {
				ForEach(Array(dishes.enumerated()), id: \.offset) { offset, dish  in
					VStack(alignment: .leading, spacing: DesignSystem.Spacings.small) {
						DishView(from: dish)
							.padding(.horizontal, DesignSystem.Spacings.margin)
						Separator()
					}
				}
			}
		}
	}
}

#Preview("Com contéudo") {
	RestaurantDetailView(
		viewModel: RestaurantDetailViewModel(
			restaurantId: "1", restaurantsService: PreviewFakeRestaurantsService(.loaded)
		)
	)
}

#Preview("Sem contéudo") {
	RestaurantDetailView(
		viewModel: RestaurantDetailViewModel(
			restaurantId: "1", restaurantsService: PreviewFakeRestaurantsService(.error)
		)
	)
}
