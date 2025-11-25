//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

enum RestaurantRequest: Requestable {
	case fetchAll
	case fetchMore(page: Int)
	case recommendations
	
	var method: RequestMethod {
		switch self {
		case .fetchAll, .fetchMore, .recommendations: return .get
		}
	}
	
	var endpoint: String {
		switch self {
		case .fetchAll, .fetchMore: return "/restaurants"
		case .recommendations: return "/recommendations"
		}
	}
	
	var params: [String : Any]? {
		switch self {
		case .fetchAll: return ["limit": "8", "page": "1"]
		case let .fetchMore(page): return ["limit": "8", "page": page.description]
		default: return nil
		}
	}
	
	var host: String { "https://69258a1482b59600d7240f7f.mockapi.io" }
	var headers: [String : String]? { nil }
	var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalCacheData }
}
