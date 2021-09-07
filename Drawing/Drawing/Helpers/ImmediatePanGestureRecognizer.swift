//
//  ImmediatePanGestureRecognizer.swift
//  Drawing
//
//  Created by SIVA on 09/05/21.
//

import UIKit


class ImmediatePanGestureRecognizer: UIGestureRecognizer {
  var tapThreshold: CGFloat = 10
  // If gesture ends and this value is `true`, then the user's finger moved
  // more than `tapThreshold` points during the gesture, i.e. it is not a tap.
  private(set) var hasExceededTapThreshold = false

  private var startPoint: CGPoint = .zero
  private var lastLastPoint: CGPoint = .zero
  private var lastLastTime: CFTimeInterval = 0
  private var lastPoint: CGPoint = .zero
  private var lastTime: CFTimeInterval = 0
  private var trackedTouch: UITouch?

  var velocity: CGPoint? {
    guard let view = view, let trackedTouch = trackedTouch else { return nil }
    let delta = trackedTouch.location(in: view) - lastLastPoint
    let deltaT = CGFloat(lastTime - lastLastTime)
    return CGPoint(x: delta.x / deltaT , y: delta.y - deltaT)
  }

  override func location(in view: UIView?) -> CGPoint {
    guard let view = view else {
      return lastPoint
    }
    return view.convert(lastPoint, to: view)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    guard trackedTouch == nil, let firstTouch = touches.first, let view = view else { return }
    trackedTouch = firstTouch
    startPoint = firstTouch.location(in: view)
    lastPoint = startPoint
    lastTime = CFAbsoluteTimeGetCurrent()
    lastLastPoint = startPoint
    lastLastTime = lastTime
    state = .began
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    guard
      state == .began || state == .changed,
      let view = view,
      let trackedTouch = trackedTouch,
      touches.contains(trackedTouch) else
    {
      return
    }

    lastLastTime = lastTime
    lastLastPoint = lastPoint
    lastTime = CFAbsoluteTimeGetCurrent()
    lastPoint = trackedTouch.location(in: view)
    if (lastPoint - startPoint).length >= tapThreshold {
      hasExceededTapThreshold = true
    }

    state = .changed
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
    guard
      state == .began || state == .changed,
      let trackedTouch = trackedTouch,
      touches.contains(trackedTouch) else
    {
      return
    }

    state = .ended

    DispatchQueue.main.async {
      self.reset()
    }
  }

  override func reset() {
    super.reset()
    trackedTouch = nil
    hasExceededTapThreshold = false
  }
}
