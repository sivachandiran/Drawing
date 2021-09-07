//
//  CGFloat+DrawingExtensions.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import CoreGraphics

extension CGFloat {
    var radians: CGFloat {
        get {
            let b = CGFloat(Double.pi) * self/180
            return b
        }
    }
}

