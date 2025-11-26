//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct AddButton: View {
	private let onTap: () -> Void
	
	public init(_ onTap: @escaping () -> Void = {}) {
		self.onTap = onTap
	}
	
	public var body: some View {
		LocalImage(named: DesignSystem.Assets.add, renderingMode: .template)
			.aspectRatio(1, contentMode: .fit)
			.foregroundStyle(DesignSystem.Colors.darkGray)
			.onTapGesture { onTap() }
	}
}

#Preview {
	AddButton()
		.frame(width: 50)
}
