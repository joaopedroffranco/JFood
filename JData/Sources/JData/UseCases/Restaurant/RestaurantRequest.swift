//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

enum RestaurantRequest: Requestable {
	case fetchAll
	case fetchMore(page: Int)
	case fetchRecommendations
	case fetchDetails(id: String)
	
	var method: RequestMethod {
		switch self {
		case .fetchAll, .fetchMore, .fetchRecommendations, .fetchDetails: return .get
		}
	}
	
	var endpoint: String {
		switch self {
		case .fetchAll, .fetchMore, .fetchDetails: return "/restaurants"
		case .fetchRecommendations: return "/recommendations"
		}
	}
	
	var params: [String : Any]? {
		switch self {
		case .fetchAll: return ["limit": "8", "page": "1"]
		case let .fetchMore(page): return ["limit": "8", "page": page.description]
		case let .fetchDetails(id): return ["id": id]
		default: return nil
		}
	}
	
	var host: String { "https://69258a1482b59600d7240f7f.mockapi.io" }
	var headers: [String : String]? { nil }
	var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalCacheData }
}
