//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct HomeView: View {
	@EnvironmentObject private var router: MainRouter
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
	private var loadingView: some View { LoadingView() }
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
	
	private var errorView: some View {
		ErrorView(Strings.errorLoadingData) { viewModel.loadContent() }
	}
	
	// MARK: Sections
	private func recommendationsSection(_ data: [RestaurantData]) -> some View {
		JSectionView(Strings.recommendations) {
			JCarousel(
				data: data,
				spacing: DesignSystem.Spacings.default) { offset, recommendation in
					RestaurantCard(data: recommendation)
						.padding(.leading, offset == 0 ? DesignSystem.Spacings.margin : 0)
						.frame(width: 330)
						.onTapGesture { router.push(.restaurantDetail(id: recommendation.id)) }
				}
		}
	}
	
	private func bannersSection(_ data: [HomeBannerData]) -> some View {
		JSectionView(Strings.banners) {
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
		JSectionView(Strings.allRestaurants) {
			LazyVStack(alignment: .leading, spacing: DesignSystem.Spacings.margin) {
				ForEach(Array(data.enumerated()), id: \.offset) { offset, restaurant in
					RestaurantCard(data: restaurant)
						.onAppear { if offset >= data.count - 1 { viewModel.loadMore() } }
						.padding(.horizontal, DesignSystem.Spacings.margin)
						.frame(maxWidth: .infinity)
						.onTapGesture { router.push(.restaurantDetail(id: restaurant.id)) }
				}
			}
		}
	}
}

#Preview("Content") {
	HomeView(
		viewModel: HomeViewModel(
			restaurantsService: PreviewFakeRestaurantsService(.loaded),
			bannersService: PreviewFakeBannerService(.loaded)
		)
	)
}

#Preview("No Content") {
	HomeView(
		viewModel: HomeViewModel(
			restaurantsService: PreviewFakeRestaurantsService(.error),
			bannersService: PreviewFakeBannerService(.error)
		)
	)
}
