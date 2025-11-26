//
//  Created by João Pedro Fabiano Franco
//

import SwiftUI

public enum DesignSystem {
  public enum Colors {
		public static let white = Color(red: 255/255, green: 255/255, blue: 255/255)
		public static let dark = Color(red: 26/255, green: 26/255, blue: 26/255)
		public static let lightGray = Color(red: 230/255, green: 230/255, blue: 230/255)
		public static let darkGray = Color(red: 50/255, green: 50/255, blue: 50/255)

		public static let background = Color(red: 250/255, green: 250/255, blue: 250/255)
		public static let primary = Color(red: 255/255, green: 58/255, blue: 58/255)
		public static let error = Color(red: 229/255, green: 57/255, blue: 53/255)
		
		public static let shadow = dark.opacity(0.1)
		public static let shadowBorder = lightGray
		public static let separator = lightGray
		
		public static let textPrimary = Color(red: 26/255, green: 26/255, blue: 26/255) /// Titles
		public static let textSecondary = Color(red: 110/255, green: 110/255, blue: 110/255) /// Descriptions
		public static let textTertiary = Color(red: 175/255, green: 175/255, blue: 175/255) /// Placeholders
  }

  public enum Fonts {
		public static let title = Font.system(size: 28, weight: .bold)
		public static let subtitle = Font.system(size: 18, weight: .semibold)
		public static let sectionTitle = Font.system(size: 20, weight: .semibold)
		public static let `default` = Font.system(size: 16)
		public static let description = Font.system(size: 14)
  }

  public enum Radius {
		public static let `default` = 16.0
		public static let small = 4.0
  }

  public enum Spacings {
		public static let small = 2.0
		public static let margin = 16.0
		public static let `default` = 8.0
		public static let largeMargin = 24.0
  }
	
	public enum Assets {
		public static let loading = "loading"
		public static let star = "star"
		public static let add = "add"
		public static let warning = "warning"
	}
}

public extension Color {
	var uiColor: UIColor { UIColor(self) }
}
