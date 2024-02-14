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
    
    var ana : UIImageView = {
        var imageAna = UIImageView()
        imageAna.image = UIImage(named: "Ana")
        imageAna.contentMode = .scaleToFill
        return imageAna
    }()
    let imageJanelly: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "janelly")
        return image
    }()
    var hugoPhoto : UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Hugo")
        image.contentMode = .scaleToFill
        return image
    }()
    var victorHugoPhoto: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "victorhugo")
        
        return image
    }()
    var imageVic : UIImageView = {
        var imageVic = UIImageView()
        imageVic.image = UIImage(named: "VicImage")
        
        return imageVic
    }()
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setupNavigation()
    navigationController?.navigationBar.isHidden = false
  
    let closeButton = UIBarButtonItem(image: UIImage(named: "cerrarSesion"), style: .plain, target: self, action: #selector(logout))
    navigationController?.navigationBar.isTranslucent = false
    navigationItem.hidesBackButton = true
    navigationItem.rightBarButtonItem = closeButton
  }
  
  
  func setupNavigation(){
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = .red
      self.navigationController?.navigationBar.standardAppearance = appearance;
      self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      initUI()
  
  }
    
    func initUI(){
      
        initAnaCard()
        initJanelly()
        initHugoCard()
        initVictorHugo()
        initVicCard()
    }
  

  @objc func logout(){
    print("Log out")
    DataBase.shared.loggout()
    viewModel.goToLogin()
  }
    
    func initAnaCard(){
        view.addSubview(ana)
        ana.addAnchorsAndSize(width: 150, height: 150, left: 15, top: 120, right: nil, bottom: nil)
    }
    
    func initJanelly() {
        view.addSubview(imageJanelly)
        imageJanelly.addAnchorsAndSize(width: 150, height: 150, left: 15, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: ana)
    }
    
    func initHugoCard(){
        view.addSubview(hugoPhoto)
        hugoPhoto.addAnchorsAndSize(width: 150, height: 150, left: nil, top: 320, right: 15, bottom: nil, withAnchor: .left, relativeToView: imageJanelly)
    }
    
    func initVictorHugo(){
        view.addSubview(victorHugoPhoto)
        victorHugoPhoto.addAnchorsAndSize(width: 150, height: 150, left: 15, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: imageJanelly)
    }
    
    func initVicCard(){
        view.addSubview(imageVic)
        imageVic.addAnchorsAndSize(width: 150, height: 150, left: nil, top: 520, right: 15, bottom: nil, withAnchor: .left, relativeToView: imageJanelly)
    }
}

