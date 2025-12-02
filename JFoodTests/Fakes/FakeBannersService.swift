//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

class FakeBannersService: BannersServiceProtocol {
	private let banners: [BannerDTO]?
	
	init(banners: [BannerDTO]?) {
		self.banners = banners
	}
	
	func get() async -> [BannerDTO]? { banners }
}
