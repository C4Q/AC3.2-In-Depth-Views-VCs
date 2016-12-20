//
//  ViewController.swift
//  AC3.2-AllProgrammaticEveryDay
//
//  Created by Louis Tur on 12/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MyLovelyViewController: UIViewController {
  
  var segueButton: UIButton = UIButton(type: UIButtonType.system)
  lazy var randomLazyView: LazyView = LazyView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Creating my lovely")
    
    print("\n\n\n>>>>>View DID LOAD\n\n\n")
    self.view.backgroundColor = .yellow
    
    print("Button frame, viewDidLoad, preConstraints: \(segueButton.frame)")
    
    self.view.addSubview(segueButton)
    self.view.addSubview(randomLazyView)
    self.segueButton.translatesAutoresizingMaskIntoConstraints = false
    self.segueButton.setTitle("PRESS ME", for: .normal)
    
    self.tabBarItem = UITabBarItem(title: "Lovely", image: nil, selectedImage: nil)
    
    let _ = [
      segueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      segueButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
      ].map { $0.isActive = true }
    
    print("Button frame, viewDidLoad, post adding constraints: \(segueButton.frame)")
    
    self.segueButton.addTarget(self, action: #selector(didPressSegueButton(sender:)), for: .touchUpInside)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    print("\n\n\n>>>>Did LAYOUT SUBVIEWS")
    print("Button frame, didLayoutSubviews, constraints: \(segueButton.frame)")
  }
  
  func didPressSegueButton(sender: UIButton) {
    print("Did press button")
    
    // 1. create our destination view controller
    let randomLovelyViewController = MyLovelyViewController()
    randomLovelyViewController.view.backgroundColor = self.randomColor()
    
    // 2. move to the destination view controller
    
    // this will present a new ViewController modally!
    //    self.present(greenViewController, animated: true, completion: nil)
    
    // but we want the navVC to manage our view controllers!
    if let navVC = self.navigationController {
      print("NavVC found")
      
      // this will present the view controller modally, but using the navVC as the source view controller as opposed to the greenViewController
 
//      navVC.present(greenViewController, animated: true, completion: nil)
      
      // pushViewController will add the view controller to the navigation stack
      navVC.pushViewController(randomLovelyViewController, animated: true)
    }
    
  }
  
  func randomColor() -> UIColor {
    let r = CGFloat(arc4random_uniform(254))
    let g = CGFloat(arc4random_uniform(254))
    let b = CGFloat(arc4random_uniform(254))
    
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\n\n\n>>>>>View DID APPEAR\n\n\n")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\n\n\n>>>>>View WILL APPEAR\n\n\n")
  }
  
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\n\n\n>>>>>View WILL DISAPPEAR\n\n\n")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\n\n\n>>>>>View DID DISAPPEAR\n\n\n")
  }
  
  
  
}

