//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let imageJanelly: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "janelly")
        return image
    }()
    
    
    var viewModel : HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink //
        
        initUI()
    }
    
    
    func initUI(){
        initJanelly()
        
        
    }
    
    
    func initJanelly() {
        view.addSubview(imageJanelly)
        imageJanelly.addAnchorsAndCenter(centerX: false, centerY: true, width: 150, height: 150, left: 15, top: nil, right: nil, bottom: nil)

        
    }
}

