//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel : HomeViewModel!
    
    
    var cerrarSesion: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "cerrarSesion"), for: .normal)
        return button
    }()
    
    
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.isHidden = false
  
    let closeButton = UIBarButtonItem(image: UIImage(named: "cerrarSesion"), style: .plain, target: self, action: #selector(logout))
  
    navigationItem.hidesBackButton = true
    navigationItem.rightBarButtonItem = closeButton
  }
  
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .systemBlue
      initUI()
  
  }
    
    func initUI(){
      
    }
  

  @objc func logout(){
    print("Log out")
    DataBase.shared.loggout()
    viewModel.goToLogin()
  }
    
  
}

