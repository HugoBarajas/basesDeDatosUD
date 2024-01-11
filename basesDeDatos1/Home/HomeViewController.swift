//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {

  var viewModel : HomeViewModel!
    
    var ana : UIImageView = {
      var imageAna = UIImageView()
      imageAna.image = UIImage(named: "Ana")
      imageAna.contentMode = .scaleAspectFill
        return imageAna
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemPink
        initUI()
        
    }
    
    func initUI(){
        view.addSubview(ana)
        ana.addAnchorsAndSize(width: 150, height: 150, left: 10, top: 65, right: nil, bottom: nil)
    }


}

