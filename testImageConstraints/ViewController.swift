//
//  ViewController.swift
//  testImageConstraints
//
//  Created by Grzegorz Zadkowski on 02/04/2022.
//

import UIKit

class ViewController: UIViewController {
  
  let imageView: UIImageView = {
    let image = UIImage(named: "image")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.addSubview(imageView)
    makeLayout()
  }
  
  func makeLayout() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints = [NSLayoutConstraint]()
    
    //imageView.top = safeArea.top
    constraints += [NSLayoutConstraint.init(item: imageView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
    
    //imageView.leading = safeArea.leading
    constraints += [NSLayoutConstraint.init(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
    
    //imageView.height = safeArea.height * 0.6
    constraints += [NSLayoutConstraint.init(item: imageView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 0.6, constant: 0.0)]
    
    //imageView.width = imageView.height
    constraints += [NSLayoutConstraint.init(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0)]
    
    view.addConstraints(constraints)
  }
}

