//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JFoundation

public struct LocalImage: View {
	private let named: String
	private let renderingMode: Image.TemplateRenderingMode
	
	public init(named: String, renderingMode: Image.TemplateRenderingMode = .original) {
		self.named = named
		self.renderingMode = renderingMode
	}
	
	public var body: some View {
		Image(named, bundle: .module)
			.resizable()
			.renderingMode(renderingMode)
	}
}
