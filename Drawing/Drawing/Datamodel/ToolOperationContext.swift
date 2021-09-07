//
//  ToolOperationContext.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import Foundation

/**
 Aggregate of objects that may be used by tools during operations
 */
public struct ToolOperationContext {
  public let drawing: Drawing
  public let operationStack: DrawingOperationStack
  public let userSettings: UserSettings
  public let toolSettings: ToolSettings
}

