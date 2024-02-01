//
//  ChangePasswordViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import UIKit

class ChangePasswordViewController: UIViewController {
  
  var viewModel : ChangePasswordViewModel!
  
  var validateDataUser : ValidateDataUser = {
    var view = ValidateDataUser()
    return view
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    initUI()
    
  }
  
  func initUI(){
    view.addSubview(validateDataUser)
    validateDataUser.addAnchors(left: 0, top: 100, right: 0, bottom: 0)
  }
  
  
}
