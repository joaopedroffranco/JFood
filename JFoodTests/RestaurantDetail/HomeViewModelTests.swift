//
//  Created by Joao Pedro Fabiano Franco.
//

import XCTest
import JUI
import Combine
@testable import JFood

final class HomeViewModelTests: XCTestCase {
	private var cancellables: Set<AnyCancellable> = []
	
	// MARK: Load Content
	func testLoadContent() async throws {
		/// given
		let restaurants = [RestaurantsStubs.burgerHouse, RestaurantsStubs.pizzaNapoli, RestaurantsStubs.healthyBowl]
		let recommendations = [RestaurantsStubs.pizzaNapoli, RestaurantsStubs.pastaBella]
		let banners = [BannersStubs.banner1, BannersStubs.banner2]
		
		let service = FakeRestaurantsService(restaurants: restaurants, recommendations: recommendations)
		let bannerService = FakeBannersService(banners: banners)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)
		
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = .loading
		await viewModel.$state
			.dropFirst(2)
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: recommendations.map { RestaurantData(from: $0) },
				allRestaurants: restaurants.map { RestaurantData(from: $0) },
				banners: banners.map { HomeBannerData(from: $0) }
			)
		)
	}
	
	func testLoadContentWithNoRecommendations() async throws {
		/// given
		let restaurants = [RestaurantsStubs.burgerHouse, RestaurantsStubs.pizzaNapoli, RestaurantsStubs.healthyBowl]
		let banners = [BannersStubs.banner1, BannersStubs.banner2]
		
		let service = FakeRestaurantsService(restaurants: restaurants, recommendations: nil)
		let bannerService = FakeBannersService(banners: banners)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)
		
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = .loading
		await viewModel.$state
			.dropFirst(2)
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: nil,
				allRestaurants: restaurants.map { RestaurantData(from: $0) },
				banners: banners.map { HomeBannerData(from: $0) }
			)
		)
	}
	
	func testLoadContentWithNoAllRestaurants() async throws {
		/// given
		let recommendations = [RestaurantsStubs.pizzaNapoli, RestaurantsStubs.pastaBella]
		let banners = [BannersStubs.banner1, BannersStubs.banner2]
		
		let service = FakeRestaurantsService(restaurants: nil, recommendations: recommendations)
		let bannerService = FakeBannersService(banners: banners)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)

		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = .loading
		await viewModel.$state
			.dropFirst(2)
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: recommendations.map { RestaurantData(from: $0) },
				allRestaurants: nil,
				banners: banners.map { HomeBannerData(from: $0) }
			)
		)
	}
	
	func testLoadContentWithNoBanners() async throws {
		/// given
		let restaurants = [RestaurantsStubs.burgerHouse, RestaurantsStubs.pizzaNapoli, RestaurantsStubs.healthyBowl]
		let recommendations = [RestaurantsStubs.pizzaNapoli, RestaurantsStubs.pastaBella]
		
		let service = FakeRestaurantsService(restaurants: restaurants, recommendations: recommendations)
		let bannerService = FakeBannersService(banners: nil)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)

		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = .loading
		await viewModel.$state
			.dropFirst(2)
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: recommendations.map { RestaurantData(from: $0) },
				allRestaurants: restaurants.map { RestaurantData(from: $0) },
				banners: nil
			)
		)
	}
	
	func testLoadContentWithNothing() async throws {
		/// given
		let service = FakeRestaurantsService(restaurants: nil, recommendations: nil)
		let bannerService = FakeBannersService(banners: nil)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)
		
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = .loading
		await viewModel.$state
			.dropFirst(2)
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.error
		)
	}
	
	// MARK: Load More
	func testLoadMore() async throws {
		/// given
		let restaurants = [RestaurantsStubs.burgerHouse, RestaurantsStubs.pizzaNapoli, RestaurantsStubs.healthyBowl]
		let moreRestaurants = [RestaurantsStubs.tacoLocos, RestaurantsStubs.pastaBella, RestaurantsStubs.sushiPrime]
		
		let service = FakeRestaurantsService(restaurants: restaurants, recommendations: nil, moreRestaurants: moreRestaurants)
		let bannerService = FakeBannersService(banners: nil)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)
		let initialState: HomeViewState = .loaded(recommendations: nil, allRestaurants: restaurants.map { RestaurantData(from: $0) }, banners: nil)

		await MainActor.run {
			viewModel.state = initialState
		}
		
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: HomeViewState = initialState
		await viewModel.$state
			.dropFirst()
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		await viewModel.loadMore()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: nil,
				allRestaurants: (restaurants + moreRestaurants).map { RestaurantData(from: $0) },
				banners: nil
			)
		)
	}
	
	func testLoadMoreWithNothing() async throws {
		/// given
		let restaurants = [RestaurantsStubs.burgerHouse, RestaurantsStubs.pizzaNapoli, RestaurantsStubs.healthyBowl]
		
		let service = FakeRestaurantsService(restaurants: restaurants, recommendations: nil, moreRestaurants: nil)
		let bannerService = FakeBannersService(banners: nil)
		let viewModel = await HomeViewModel(restaurantsService: service, bannersService: bannerService)
		let initialState: HomeViewState = .loaded(recommendations: nil, allRestaurants: restaurants.map { RestaurantData(from: $0) }, banners: nil)

		await MainActor.run {
			viewModel.state = initialState
		}
		
		let expectation = XCTestExpectation(description: "Getting content...")
		expectation.isInverted = true
		var expectedState: HomeViewState = initialState
		await viewModel.$state
			.dropFirst()
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		/// when
		await viewModel.loadMore()
		
		/// then
		await fulfillment(of: [expectation], timeout: 5)
		XCTAssertEqual(
			expectedState,
			.loaded(
				recommendations: nil,
				allRestaurants: restaurants.map { RestaurantData(from: $0) },
				banners: nil
			)
		)
	}
}
