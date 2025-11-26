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
	
	// MARK: Get More
	func testGetMoreRegularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.regularRestaurants))
		
		// when
		let moreRestaurants = await service.getMore()

		// then
		XCTAssertEqual(moreRestaurants?.count, 3)
	}
	
	func testGetMoreIrregularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.irregularRestaurants))
		
		// when
		let moreRestaurants = await service.getMore()

		// then
		XCTAssertNil(moreRestaurants)
	}
	
	func testGetMoreEmptyResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.emptyRestaurants))
		
		// when
		let moreRestaurants = await service.getMore()

		// then
		XCTAssertNil(moreRestaurants)
	}
	
	// MARK: Details
	func testGetDetailsRegularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.regularRestaurants))
		
		// when
		let restaurant = await service.getDetails(for: "any")

		// then
		XCTAssertNotNil(restaurant)
	}
	
	func testGetDetailsIrregularResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.irregularRestaurants))
		
		// when
		let restaurant = await service.getDetails(for: "any")

		// then
		XCTAssertNil(restaurant)
	}
	
	func testGetDetailsEmptyResponse() async throws {
		// given
		let service = RestaurantsService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.emptyRestaurants))
		
		// when
		let restaurant = await service.getDetails(for: "any")

		// then
		XCTAssertNil(restaurant)
	}
}
