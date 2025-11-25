//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

enum RestaurantRequest: Requestable {
	case fetchAll
	case recommendations
	
	var method: RequestMethod {
		switch self {
		case .fetchAll, .recommendations: return .get
		}
	}
	
	var endpoint: String {
		switch self {
		case .fetchAll: return "/restaurants"
		case .recommendations: return "/recommendations"
		}
	}
	
	var params: [String : Any]? {
		switch self {
		case .fetchAll, .recommendations: return nil
		}
	}
	
	var host: String { "https://69258a1482b59600d7240f7f.mockapi.io" }
	var headers: [String : String]? { nil }
	var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalCacheData }
}
