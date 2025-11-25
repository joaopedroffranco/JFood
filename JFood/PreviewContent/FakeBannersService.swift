//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

class PreviewFakeBannerService: BannersServiceProtocol {
	var state: PreviewState
	
	init(_ state: PreviewState) {
		self.state = state
	}
	
	private let instance = Banner(id: "123", image: "https://picsum.photos/200/800")
	
	func get() async -> [Banner]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
}

