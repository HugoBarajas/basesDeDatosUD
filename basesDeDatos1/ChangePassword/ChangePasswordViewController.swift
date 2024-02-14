//
//  ChangePasswordViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import UIKit



class ChangePasswordViewController: UIViewController{
  
  var viewModel : ChangePasswordViewModel!
  
  var validateDataUser : ValidateDataUser = {
    var view = ValidateDataUser()
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    validateDataUser.delegate = self
    initUI()
    
  }
  
  
  func initUI(){
    view.addSubview(validateDataUser)
    validateDataUser.addAnchors(left: 0, top: 100, right: 0, bottom: 0)
  }
  
  
}


extension ChangePasswordViewController : VaildateDataUserDefaults{
  func goToLogin() {
    viewModel.goToLogin()
  }
  func alert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    present(alert, animated: true)
   }
  
  
}


