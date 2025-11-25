//
//  Created by Joao Pedro Fabiano Franco.
//

import XCTest
@testable import JData

final class RestaurantsServiceTests: XCTestCase {
	
	// MARK: All Restaurants
	func testGetAllRegularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.regularRestaurants))
		
		// when
		let allRestaurants = await service.getAll()

		// then
		XCTAssertEqual(allRestaurants?.count, 3)
	}
	
	func testGetAllIrregularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.irregularRestaurants))
		
		// when
		let allRestaurants = await service.getAll()

		// then
		XCTAssertNil(allRestaurants)
	}
	
	func testGetAllEmptyResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.emptyRestaurants))
		
		// when
		let allRestaurants = await service.getAll()

		// then
		XCTAssertNil(allRestaurants)
	}
	
	// MARK: Recommendations
	func testGetRecommendationsRegularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.regularRestaurants))
		
		// when
		let allRestaurants = await service.getRecommendations()

		// then
		XCTAssertEqual(allRestaurants?.count, 3)
	}
	
	func testGetRecommendationsIrregularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.irregularRestaurants))
		
		// when
		let allRestaurants = await service.getRecommendations()

		// then
		XCTAssertNil(allRestaurants)
	}
	
	func testGetRecommendationsEmptyResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.emptyRestaurants))
		
		// when
		let allRestaurants = await service.getRecommendations()

		// then
		XCTAssertNil(allRestaurants)
	}
}
