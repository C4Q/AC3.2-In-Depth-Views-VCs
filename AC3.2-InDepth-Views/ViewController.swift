//
//  ViewController.swift
//  AC3.2-InDepth-Views
//
//  Created by Louis Tur on 12/19/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var animatedView: AnimatedView = AnimatedView()

  override func viewDidLoad() {
    super.viewDidLoad()
    print("View Did Load")
    
    view.backgroundColor = .white
    self.animatedView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(animatedView)
    
    let _ = [
      animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      animatedView.widthAnchor.constraint(equalToConstant: 200.0),
      animatedView.heightAnchor.constraint(equalToConstant: 200.0)
      ].map { $0.isActive = true }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    print("View Will Appear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
//    animatedView.animateColorChange()
//    animatedView.animateBoundsChange()
    animatedView.animatePositionChange()
    
    print("View Did Appear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    print("View did Disappear")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    print("View Will Disappear")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    print("View Did LayoutSubviews")
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    print("View Will Layout Subviews")
  }
  
  
}

class AnimatedView: UIView {
  internal var gridColor: UIColor = .black
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    print("Calling default frame init")
    
    self.backgroundColor = .blue
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func adjustGridColor(_ color: UIColor) {
    self.gridColor = color
    self.setNeedsDisplay()
  }
  
  func animateColorChange() {
    self.backgroundColor = .blue
    UIView.animate(withDuration: 1.25) {
      self.backgroundColor = .red
    }
  }
  
  func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
    return (180 / CGFloat(M_PI)) * degrees
  }
  
  func animateBoundsChange() {
    let borderAnimation = CABasicAnimation(keyPath: "cornerRadius")
    borderAnimation.fromValue = self.layer.cornerRadius
    borderAnimation.toValue = self.layer.bounds.size.width / 2.0
    borderAnimation.duration = 1.25
    borderAnimation.fillMode = kCAFillModeForwards
    borderAnimation.isRemovedOnCompletion = false
    
    self.layer.add(borderAnimation, forKey: "border")
  }
  
  func animatePositionChange() {
    UIView.animate(withDuration: 1.0) {
      self.center = CGPoint(x: self.center.x + 50, y: self.center.y + 50)
    }
  }
  
}
