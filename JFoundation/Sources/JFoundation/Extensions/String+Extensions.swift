//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public extension String {
	var asUrl: URL? { URL(string: self) }
}
