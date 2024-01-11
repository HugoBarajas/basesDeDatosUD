//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {

  var viewModel : HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemPink // 
        
      initUI()
    }
    
  
  func initUI(){
    initVicCard()
  }

  
  
  func initVicCard(){
      var imageVic : UIImageView = {
        var imageVic = UIImageView()
        imageVic.image = UIImage(named: "VicImage")
       
        return imageVic
      }()
      
      view.addSubview(imageVic)
      imageVic.addAnchorsAndSize(width: 150, height: 150, left: nil, top: nil, right: 15, bottom: 75)
  }

}

