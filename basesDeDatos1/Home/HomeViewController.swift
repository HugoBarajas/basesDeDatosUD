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

  var hugoPhoto : UIImageView = {
      var image = UIImageView()
      image.image = UIImage(named: "hugo")
      image.contentMode = .scaleAspectFill
    
      return image
    }()

  var viewModel : HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemPink // 
        
      initUI()
    }
 
  func initUI(){

    initVicCard()
    initTekiCard()
      initVictorHugo()
        initHugoCard()
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

  func initTekiCard(){
    // Aqui van a crear su tarjrta de su foto

  }
  
  func initHugoCard(){
    view.addSubview(hugoPhoto)
    hugoPhoto.addAnchorsAndCenter(centerX: false, centerY: true, width: 150, height: 150, left: nil, top: nil, right: 15, bottom: nil)
    
  }
  
  
    func initVictorHugo(){
        view.addSubview(victorHugoPhoto)
        victorHugoPhoto.addAnchorsAndSize(width: 150, height: 150, left: 15, top: nil, right: nil, bottom: 75)
    }
}

