//
//  Created by Joao Pedro Fabiano Franco.
//
	
import SwiftUI

public struct JList<Data: Hashable, Row: View>: View {
	private let data: [Data]
	private let rowView: (Int, Data) -> Row
	private let spacing: CGFloat
	
	public init(
		data: [Data],
		spacing: CGFloat = .zero,
		@ViewBuilder row: @escaping (Int, Data) -> Row
	) {
		self.data = data
		self.rowView = row
		self.spacing = spacing
	}
	
	public var body: some View {
		List {
			ForEach(Array(data.enumerated()), id: \.offset) { offset, object in
				rowView(offset, object)
					.listRowInsets(
						.init(
							top: .zero,
							leading: .zero,
							bottom: spacing,
							trailing: .zero
						)
					)
					.listRowBackground(DesignSystem.Colors.background)
					.listRowSeparator(.hidden)
			}
		}
		.listStyle(.plain)
	}
}

#Preview {
	Group {
		JList(data: ["a", "b", "c"]) { _, element in
			Text(element.description)
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.background(.red)
		}
		
		JList(data: [1, 2, 3, 4, 5], spacing: 10) { _, element in
			Text(element.description)
				.background(.red)
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.background(.red)
		}
	}
}
