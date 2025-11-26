//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import SwiftUI

@MainActor
class MainRouter: ObservableObject {
	@Published var path: NavigationPath = .init()
	
	func push(_ next: JFoodAppRoute) {
		path.append(next)
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path = .init()
	}
}
