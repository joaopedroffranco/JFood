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

		Task {
			try? await Task.sleep(nanoseconds: 2_000_000_000)
			self.message = nil
		}
	}
}
