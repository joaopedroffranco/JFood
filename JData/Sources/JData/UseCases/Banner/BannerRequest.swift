//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation

enum BannerRequest: Requestable {
	case fetch
	
	var method: RequestMethod {
		switch self {
		case .fetch: return .get
		}
	}
	
	var endpoint: String {
		switch self {
		case .fetch: return "/banners.json"
		}
	}
	
	var params: [String : Any]? {
		switch self {
		case .fetch: return nil
		}
	}
	
	var host: String { "https://gist.githubusercontent.com/joaopedroffranco/024aa448636ce6e8a955753f9f4ebbe2/raw/04e1a2762e47224bf9579677e0cdc4494969bec3" }
	var headers: [String : String]? { nil }
	var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalCacheData }
}
