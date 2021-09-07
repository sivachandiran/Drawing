//
//  AngleTool.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import Foundation

public class AngleTool: DrawingToolForShapeWithThreePoints {
  public override var name: String { return "Angle" }
  public override func makeShape() -> ShapeType {
    let shape = AngleShape()
    return shape
  }
}
