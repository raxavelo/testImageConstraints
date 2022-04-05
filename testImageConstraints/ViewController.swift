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
    
    /*
     UIImageView jest takim kontenerem na UIImage - Widokiem, w którym jest zagnieżdżony obraz.
     Jeśli imageView.contenMode == .scaleAspectFill rozmiar zdjęcia jest zmieniany tak, żeby całe się mieściło w UIImageView i były zachowane proporcje zdjęcia.
     Jeśli imageView.contentMode == .scaleApectFill rozmiar zdjęcia jest tak zmieniany, żeby było w UIImageView była widoczną jak największa powierzchnia zdjęcia, ale żeby UIImageView było wypełnione w całości i były zachowane proporcje zdjęcia.
     I tutaj się pojawia problem, że gdy zdjęcie nie ma takich proporcji jak UIImageView, część zdjęcia wystaje poza widok i dlatego jest wrażenie, że zignorowane jest safeArea.
     
     Rozwiązanie
     UIImageView ma właściwość clipsToBound: Bool, która określa zachowanie w tej sytuacji. Domyślna wartość to false. Gdy jest true, wystająca poza widok część zdjęcia jest przycinana.
     */
    
    imageView.clipsToBounds = true // O to całe zamieszanie
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
    
    
    let constraints = [
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
      imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
    ]
    
    view.addConstraints(constraints)
  }
}

