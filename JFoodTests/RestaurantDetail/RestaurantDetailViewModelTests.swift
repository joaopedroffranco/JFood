//
//  Created by Joao Pedro Fabiano Franco.
//

import XCTest
import JUI
import Combine
@testable import JFood

final class RestaurantDetailViewModelTests: XCTestCase {
	private var cancellables: Set<AnyCancellable> = []
	
	func testLoadContent() async throws {
		/// given
		let selectedRestaurant = RestaurantsStubs.burgerHouse
		let service = FakeRestaurantsService(restaurants: [selectedRestaurant], recommendations: nil)
		let viewModel = await RestaurantDetailViewModel(restaurantId: selectedRestaurant.id, restaurantsService: service)
		
		/// when
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: RestaurantDetailViewState = .loading
		await viewModel.$state
			.dropFirst()
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		await fulfillment(of: [expectation], timeout: 5)
		
		/// then
		XCTAssertEqual(expectedState, .loaded(restaurant: Restaurant(from: selectedRestaurant)))
	}
	
	func testLoadContentWithNothing() async throws {
		/// given
		let selectedRestaurant = RestaurantsStubs.burgerHouse
		let service = FakeRestaurantsService(restaurants: nil, recommendations: nil)
		let viewModel = await RestaurantDetailViewModel(restaurantId: selectedRestaurant.id, restaurantsService: service)
		
		/// when
		let expectation = XCTestExpectation(description: "Getting content...")
		var expectedState: RestaurantDetailViewState = .loading
		await viewModel.$state
			.dropFirst()
			.sink { state in
				expectedState = state
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		XCTAssertEqual(expectedState, .loading)
		await viewModel.loadContent()
		
		await fulfillment(of: [expectation], timeout: 5)
		
		/// then
		XCTAssertEqual(expectedState, .error)
	}
}
