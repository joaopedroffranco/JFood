//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

struct HomeBannerData: Hashable {
	let id: String
	let image: String
	
	init(id: String, image: String) {
		self.id = id
		self.image = image
	}
}

extension HomeBannerData {
	init(from banner: Banner) {
		self.init(id: banner.id, image: banner.image)
	}
}
