//
//  Created by Joao Pedro Fabiano Franco.
//

import XCTest
@testable import JData

final class BannersServiceTests: XCTestCase {
	// MARK: - Get
	func testGetRegularResponse() async throws {
		// given
		let service = BannersService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.regularBanners))
		
		// when
		let allBanners = await service.get()
		
		// then
		XCTAssertEqual(allBanners?.count, 4)
	}
	
	func testGetIrregularResponse() async throws {
		// given
		let service = BannersService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.irregularBanners))
		
		// when
		let allBanners = await service.get()
		
		// then
		XCTAssertNil(allBanners)
	}
	
	func testGetEmptyResponse() async throws {
		// given
		let service = BannersService(dataSource: FakeRemoteDataSource(jsonFile: JSONFile.emptyBanners))
		
		// when
		let allBanners = await service.get()
		
		// then
		XCTAssertNil(allBanners)
	}
}
