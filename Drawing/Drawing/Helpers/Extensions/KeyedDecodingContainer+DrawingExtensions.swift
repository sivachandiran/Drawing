//
//  KeyedDecodingContainer+DrawingExtensions.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import UIKit

extension KeyedDecodingContainer {
  func decodeColorIfPresent(forKey key: K) throws -> UIColor? {
    guard let hexString = try decodeIfPresent(String.self, forKey: key) else { return nil }
    return UIColor(hexString: hexString)
  }
}
