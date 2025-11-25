//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import Kingfisher

public struct JImage: View {
	let image: URL?
	
	public init(_ image: URL? = nil) {
		self.image = image
	}

	public var body: some View {
		KFImage(image)
			.resizable()
	}
}

#Preview {
	JImage("https://picsum.photos/200/800".asUrl)
}
