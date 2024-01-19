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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    func initUI(){
        
        let navBar = UINavigationBar()
        let navItem = UINavigationItem()
        navBar.setItems([navItem], animated: true)
        let backButton = UIBarButtonItem(title: "Atrás", style: .plain, target: self, action: nil)
        navItem.leftBarButtonItem = backButton
        view.addSubview(navBar)
        navBar.addAnchors(left: 0, top: 60, right: 0, bottom: nil)
        navBar.barTintColor = .white
        
        initAnaCard()
        initJanelly()
        initHugoCard()
        initVictorHugo()
        initVicCard()
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

