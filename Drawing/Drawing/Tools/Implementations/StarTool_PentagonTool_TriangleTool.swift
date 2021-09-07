//
//  StarTool_PentagonTool_TriangleTool.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import Foundation

public class StarTool: DrawingToolForShapeWithTwoPoints {
    public override var name: String { return "Star" }
    public override func makeShape() -> ShapeType { return StarShape() }
}

public class PentagonTool: DrawingToolForShapeWithTwoPoints {
    public override var name: String { return "Pentagon" }
    public override func makeShape() -> ShapeType { return NgonShape(5) }
}

public class TriangleTool: DrawingToolForShapeWithTwoPoints {
    public override var name: String { return "Triangle" }
    public override func makeShape() -> ShapeType { return NgonShape(3) }
}


