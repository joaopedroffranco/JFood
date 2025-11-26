//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct JCarousel<Data: Hashable, Row: View>: View {
	private let data: [Data]
	private let rowView: (Int, Data) -> Row
	private let spacing: CGFloat
	
	public init(
		data: [Data],
		spacing: CGFloat = .zero,
		@ViewBuilder row: @escaping (Int, Data) -> Row) {
			self.data = data
			self.rowView = row
			self.spacing = spacing
		}
	
	public var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack(alignment: .center, spacing: spacing) {
				ForEach(Array(data.enumerated()), id: \.offset) { offset, object in
					rowView(offset, object)
				}
			}
		}
	}
}

#Preview {
	JCarousel(data: ["abc", "def", "1234", "abc", "def", "1234"], spacing: 4) { _, element in
		Text(element.description)
			.frame(width: 100, height: 50)
			.background(.red)
	}
}
