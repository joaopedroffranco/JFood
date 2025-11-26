//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct Separator: View {
	public init() {}
	
	public var body: some View {
		Rectangle()
			.frame(height: 1)
			.foregroundColor(DesignSystem.Colors.separator)
	}
}

#Preview {
	Separator()
		.padding()
}
