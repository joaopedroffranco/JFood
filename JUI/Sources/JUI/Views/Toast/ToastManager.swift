//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import Combine

@MainActor
public class ToastManager: ObservableObject {
	@Published public var message: String?
	
	public init() {}
	
	public func show(_ message: String) {
		self.message = message
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in self?.message = nil }
	}
}
