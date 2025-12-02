//
//  Created by Joao Pedro Fabiano Franco.
//

import Combine
import JData
import JUI

enum HomeViewState: Equatable {
	case loading
	case loaded(recommendations: [Restaurant]?, allRestaurants: [Restaurant]?, banners: [Banner]?)
	case error
}

@MainActor
class HomeViewModel: ObservableObject {
	private let restaurantsService: RestaurantsServiceProtocol
	private let bannersService: BannersServiceProtocol

	@Published var state: HomeViewState = .loading
	
	init(
		restaurantsService: RestaurantsServiceProtocol = RestaurantsService(),
		bannersService: BannersServiceProtocol = BannersService()
	) {
		self.restaurantsService = restaurantsService
		self.bannersService = bannersService
	}
	
	func loadContent() {
		Task { await fetch() }
	}
	
	func loadMore() {
		Task { await fetchMore() }
	}
}

private extension HomeViewModel {
	func fetch() async {
		state = .loading

		async let fetchRecommendations = fetchRecommendations()
		async let fetchAllRestaurants = fetchAllRestaurants()
		async let fetchBanners = fetchBanners()
		let (recommendations, allRestaurants, banners) = await (fetchRecommendations, fetchAllRestaurants, fetchBanners)
		
		switch (recommendations, allRestaurants, banners) {
		case (.none, .none, .none):
			self.state = .error
		default:
			self.state = .loaded(recommendations: recommendations, allRestaurants: allRestaurants, banners: banners)
		}
	}
	
	func fetchMore() async {
		switch state {
		case let .loaded(recommendations, allRestaurants, banners):
			guard let allRestaurants = allRestaurants, let moreRestaurants = await fetchMoreRestaurants() else { return }
			self.state = .loaded(recommendations: recommendations, allRestaurants: allRestaurants + moreRestaurants, banners: banners)
		default: break
		}
	}
	
	func fetchRecommendations() async -> [Restaurant]? {
		guard let recommendations = await restaurantsService.getRecommendations() else { return nil }
		return recommendations.map { Restaurant(from: $0) }
	}
	
	func fetchAllRestaurants() async -> [Restaurant]? {
		guard let allRestaurants = await restaurantsService.getAll() else { return nil }
		return allRestaurants.map { Restaurant(from: $0) }
	}
	
	func fetchBanners() async -> [Banner]? {
		guard let banners = await bannersService.get() else { return nil }
		return banners.map { Banner(from: $0) }
	}
	
	func fetchMoreRestaurants() async -> [Restaurant]? {
		guard let moreRestaurants = await restaurantsService.getMore() else { return nil }
		return moreRestaurants.map { Restaurant(from: $0) }
	}
}
