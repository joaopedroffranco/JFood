//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct HomeSectionView<Content: View>: View {
	let title: String
	let contentView: () -> Content
	
	init(_ title: String, content: @escaping () -> Content) {
		self.title = title
		self.contentView = content
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: DesignSystem.Spacings.default) {
			Text(title)
				.font(DesignSystem.Fonts.title)
				.foregroundStyle(DesignSystem.Colors.textPrimary)
				.padding(.leading, DesignSystem.Spacings.largeMargin)
			
			contentView()
		}
	}
}

#Preview {
	HomeSectionView("My Title") {
		HStack {
			Rectangle().fill(Color.blue)
				.frame(width: 100, height: 100)
			Rectangle().fill(Color.red)
				.frame(width: 100, height: 100)
		}
	}
}
