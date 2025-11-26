//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import SwiftUI

public extension String {
	var asColor: Color {
		var hex = self.trimmingCharacters(in: .whitespacesAndNewlines)
		hex = hex.replacingOccurrences(of: "#", with: "")
		
		guard hex.count == 6, let intCode = Int(hex, radix: 16) else { return Color.white }
		
		let red = Double((intCode >> 16) & 0xFF) / 255
		let green = Double((intCode >> 8) & 0xFF) / 255
		let blue = Double(intCode & 0xFF) / 255
		
		return Color(red: red, green: green, blue: blue)
	}
}
