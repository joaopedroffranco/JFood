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
	
	var host: String { "https://gist.githubusercontent.com/joaopedroffranco/024aa448636ce6e8a955753f9f4ebbe2/raw/19a9c95b958921b113e3e653aef2559c22e0b8ae" }
	var headers: [String : String]? { nil }
	var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalCacheData }
}
