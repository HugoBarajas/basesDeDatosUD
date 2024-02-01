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
    
    var masculineView : UIView = {
       var masculineView = UIView()
        masculineView.backgroundColor = .systemBlue
        masculineView.layer.cornerRadius = 20
        return masculineView
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
      view.backgroundColor = .white
      initUI()
  
  }
    
    func initUI(){
        view.addSubview(masculineView)
        masculineView.addAnchorsAndCenter(centerX: true, centerY: false, width: width-20, height: height/3, left: nil, top: 110, right: nil, bottom: nil)
        
    }
  

  @objc func logout(){
    print("Log out")
    DataBase.shared.loggout()
    viewModel.goToLogin()
  }
    
  
}

