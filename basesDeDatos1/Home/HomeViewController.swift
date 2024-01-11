//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var victorHugoPhoto: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "victorhugo")
        
        return image
    }()

  var viewModel : HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemPink // 
        
      initUI()
    }
    
  
  func initUI(){
    initTekiCard()
      initVictorHugo()
  }

  
  
  func initTekiCard(){
    // Aqui van a crear su tarjrta de su foto
  }

    func initVictorHugo(){
        view.addSubview(victorHugoPhoto)
        victorHugoPhoto.addAnchorsAndSize(width: 150, height: 150, left: 15, top: nil, right: nil, bottom: 75)
    }
}

