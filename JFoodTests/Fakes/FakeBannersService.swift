//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

class FakeBannersService: BannersServiceProtocol {
	private let banners: [Banner]?
	
	init(banners: [Banner]?) {
		self.banners = banners
	}
	
	func get() async -> [Banner]? { banners }
}
