//
//  UIColorHNExtensions.swift
//
//	The MIT License (MIT)
//
//  Created by Chris Flesner on 10/12/15.
//  Copyright © 2015 Chris Flesner. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


import UIKit


public extension UIColor {

	var alpha: CGFloat { return hn_getAlpha() }

	var red: CGFloat { return hn_getRed() }
	var green: CGFloat { return hn_getGreen() }
	var blue: CGFloat { return hn_getBlue() }

	var hue: CGFloat { return hn_getHue() }
	var saturation: CGFloat { return hn_getSaturation() }
	var brightness: CGFloat { return hn_getBrightness() }

	var luminance: CGFloat { return hn_getLuminance() }

	var isPatternBased: Bool { return hn_isPatternBased() }

	var dimmedColor: UIColor { return hn_dimmedColor() }
	var complementaryColor: UIColor? { return hn_complementaryColor() }


	var analogousColors: (UIColor, UIColor, UIColor) {
		let colors = hn_analogousColors()
		return (colors[0], colors[1], colors[2])
	}


	var splitComplementaryColors: (UIColor, UIColor, UIColor)? {
		guard let colors = hn_splitComplementaryColors() else { return nil }
		return (colors[0], colors[1], colors[2])
	}


	var triadicColors: (UIColor, UIColor, UIColor)? {
		guard let colors = hn_triadicColors() else { return nil }
		return (colors[0], colors[1], colors[2])
	}


	var tetradicColors: (UIColor, UIColor, UIColor, UIColor)? {
		guard let colors = hn_tetradicColors() else { return nil }
		return (colors[0], colors[1], colors[2], colors[3])
	}


	var squareColors: (UIColor, UIColor, UIColor, UIColor)? {
		guard let colors = hn_squareColors() else { return nil }
		return (colors[0], colors[1], colors[2], colors[3])
	}


	var contrastingTextColor: UIColor { return hn_contrastingTextColor() }

	var hexString: String { return hn_hexString() }


	class var randomColor: UIColor { return hn_randomColor() }


	func colorWithHue(hue: CGFloat) -> UIColor { return hn_colorWithHue(hue) }
	func colorWithSaturation(saturation: CGFloat) -> UIColor { return hn_colorWithSaturation(saturation) }
	func colorWithBrightness(brightness: CGFloat) -> UIColor { return hn_colorWithBrightness(brightness) }

	func contrastRatioWithColor(color: UIColor) -> CGFloat { return hn_contrastRatioWithColor(color) }
	func isAccessibleWithBackgroundColor(color: UIColor) -> Bool { return hn_isAccessibleWithBackgroundColor(color) }


	class func colorAtPosition(position: CGFloat, fromColor: UIColor, toColor: UIColor) -> UIColor {
		return hn_colorAtPosition(position, fromColor: fromColor, toColor: toColor)
	}


	class func colorAtPosition(position: CGFloat, withinColors colors: [UIColor]) -> UIColor {
		return hn_colorAtPosition(position, withinColors: colors)
	}


	func colorByBlendingWithColor(source: UIColor, mode: HNColorBlendingMode, alpha: CGFloat = 1.0) -> UIColor? {
		return hn_colorByBlendingWithColor(source, mode: mode, alpha: alpha)
	}


	class func colorForHexString(colorCode: String) -> UIColor { return hn_colorForHexString(colorCode) }

	class func colorForString(string: String, withIdeal color: UIColor?) -> UIColor? { return hn_colorForString(string, withIdeal: color) }

}


public func ==(lhs: UIColor, rhs: UIColor) -> Bool { return lhs.hn_isEqualToColor(rhs) }
