//
//  HomeViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel : HomeViewModel!
    let dataBase = DataBase.shared
    
    var genderLabel: UILabel = {
        var label = UILabel()
        //label.text = "gender"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .red
        
        return label
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.backgroundColor = .red
        return label
    }()
    
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
    
    var profilePicture: UIView = {
        var profilePic = UIView()
        return profilePic
    }()
    
    var picture: UIImageView = {
        var picture = UIImageView()
        picture.image = UIImage(named: "userProfile")
        picture.layer.cornerRadius = 40
        picture.layer.borderWidth = 2
        picture.clipsToBounds = true
        picture.layer.borderColor = UIColor.black.cgColor
        return picture
    }()
    
    
    var buttonAddImage: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "addPicture"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        getUser()
    }
    
    func initUI(){
        let navigationBarHeight = view.safeAreaLayoutGuide.topAnchor
        view.addSubview(masculineView)
        masculineView.addAnchorsAndCenter(centerX: true, centerY: false, width: width-20, height: height/3, left: nil, top: 20, right: nil, bottom: nil)
        
        masculineView.addSubview(profilePicture)
        profilePicture.addAnchorsAndCenter(centerX: true, centerY: false, width: 80, height: 80, left: nil, top: 30, right: nil, bottom: nil)
        
        profilePicture.addSubview(picture)
        picture.addAnchorsAndCenter(centerX: true, centerY: true, width: 80, height: 80, left: nil, top: nil, right: nil, bottom: nil)
        
        profilePicture.addSubview(buttonAddImage)
        buttonAddImage.addAnchorsAndSize(width: 20, height: 20, left:nil , top: nil, right: 0, bottom: 0)
        
        masculineView.addSubview(genderLabel)
        genderLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width-30, height: 20, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top,relativeToView: profilePicture)
        
    }
    @objc func logout(){
        print("Log out")
        DataBase.shared.loggout()
        viewModel.goToLogin()
    }
    func setupNavigation(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemYellow
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
    func getUser() -> String{
        if let user = dataBase.getUserLogged(){
            let userName = user.name
            let userGender = user.gender
            //User.append[userName, userGender]
            //let user = User(user: userName, gender: userGender)
            genderLabel.text = userGender
            nameLabel.text = userName
       print(user)
            return userName!
            
        } else{
            return ""
        }
    }
    
}
