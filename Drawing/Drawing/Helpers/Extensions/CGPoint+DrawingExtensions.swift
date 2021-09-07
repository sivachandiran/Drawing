//
//  CGPoint+DrawingExtensions.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import CoreGraphics

extension CGPoint {
  init(angle: CGFloat, radius: CGFloat) {
    self.init(x: cos(angle) * radius, y: sin(angle) * radius)
  }

  var length: CGFloat {
    return sqrt((x * x) + (y * y))
  }
}

func +(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
  return CGPoint(x: a.x + b.x, y: a.y + b.y)
}

func -(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
  return CGPoint(x: a.x - b.x, y: a.y - b.y)
}
