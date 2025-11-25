//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public protocol JSONFileProtocol {
	var name: String { get }
}

/// This enum provides a clear and organized way to reference JSON file names in the application.
public enum JSONFile: JSONFileProtocol {
	case regularRestaurants
	case irregularRestaurants
	case emptyRestaurants
	case regularBanners
	case irregularBanners
	case emptyBanners

	public var name: String {
		switch self {
		case .regularRestaurants: return "regular_restaurants"
		case .irregularRestaurants: return "irregular_restaurants"
		case .emptyRestaurants: return "empty_restaurants"
		case .regularBanners: return "regular_banners"
		case .irregularBanners: return "irregular_banners"
		case .emptyBanners: return "empty_banners"
		}
	}
}
