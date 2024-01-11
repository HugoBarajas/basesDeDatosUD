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
    initTekiCard()
  }

  
  
  func initTekiCard(){
    // Aqui van a crear su tarjrta de su foto
  }

}

