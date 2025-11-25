//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct HomeView: View {
	@ObservedObject private var viewModel: HomeViewModel
	
	init(viewModel: HomeViewModel) {
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
			case let .loaded(recommendations, allRestaurants, banners):
				contentView(
					recommendations: recommendations,
					allRestaurants: allRestaurants,
					banners: banners
				)
			}
		}
		.onFirstAppear { viewModel.loadContent() }
		.refreshable { viewModel.loadContent() }
		.background(DesignSystem.Colors.background)
	}
	
	// MARK: States
	private var errorView: some View { Text("Error") }
	private var loadingView: some View { Loading() }
	private func contentView(
		recommendations: [RestaurantData]?,
		allRestaurants: [RestaurantData]?,
		banners: [HomeBannerData]?
	) -> some View {
		ScrollView(.vertical, showsIndicators: true) {
			VStack(spacing: DesignSystem.Spacings.margin) {
				if let recommendations = recommendations {
					recommendationsSection(recommendations)
					Separator()
				}
				
				if let banners = banners {
					bannersSection(banners)
					Separator()
				}
				
				if let allRestaurants = allRestaurants { allRestaurantsSection(allRestaurants) }
			}
		}
	}
	
	// MARK: Sections
	private func recommendationsSection(_ data: [RestaurantData]) -> some View {
		HomeSectionView(Strings.recommendations) {
			JCarousel(
				data: data,
				spacing: DesignSystem.Spacings.default) { offset, recommendation in
					JRestaurantCard(
						image: recommendation.imageUrl,
						title: recommendation.name,
						subtitle: recommendation.description,
						rating: (recommendation.rating, recommendation.numberOfRatings)
					)
					.padding(.leading, offset == 0 ? DesignSystem.Spacings.margin : 0)
					.frame(width: 330)
				}
		}
	}
	
	private func bannersSection(_ data: [HomeBannerData]) -> some View {
		HomeSectionView(Strings.banners) {
			JCarousel(
				data: data,
				spacing: DesignSystem.Spacings.default) { offset, banner in
					JImage(banner.image.asUrl)
						.cornerRadius(DesignSystem.Radius.default)
						.padding(.leading, offset == 0 ? DesignSystem.Spacings.margin : 0)
						.frame(width: 300, height: 150)
				}
		}
	}
	
	private func allRestaurantsSection(_ data: [RestaurantData]) -> some View {
		HomeSectionView(Strings.allRestaurants) {
			LazyVStack(alignment: .leading, spacing: DesignSystem.Spacings.margin) {
				ForEach(Array(data.enumerated()), id: \.offset) { offset, restaurant in
					JRestaurantCard(
						image: restaurant.imageUrl,
						title: restaurant.name,
						subtitle: restaurant.description,
						rating: (restaurant.rating, restaurant.numberOfRatings)
					)
					.onAppear { if offset >= data.count - 1 { viewModel.loadMore() } }
					.padding(.horizontal, DesignSystem.Spacings.margin)
					.frame(maxWidth: .infinity)
				}
			}
		}
	}
}

#Preview("Com contéudo") {
	HomeView(
		viewModel: HomeViewModel(
			restaurantsService: PreviewFakeRestaurantsService(.loaded),
			bannersService: PreviewFakeBannerService(.loaded)
		)
	)
}

#Preview("Sem contéudo") {
	HomeView(
		viewModel: HomeViewModel(
			restaurantsService: PreviewFakeRestaurantsService(.error),
			bannersService: PreviewFakeBannerService(.error)
		)
	)
}
