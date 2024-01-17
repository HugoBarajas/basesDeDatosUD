//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit


var phoneNumberTextField : UITextField = {
    var pNumberTF = UITextField()
    pNumberTF.placeholder = "Telefono Celular"
    pNumberTF.keyboardType = .numberPad
    return pNumberTF
}()

class RegisterViewController: UIViewController {
  var viewModel : RegisterViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .red
initUI()
      
    }
    
  var names : UITextField = {
    var textField = UITextField()
    textField.placeholder = "Usuario"
    textField.backgroundColor = .white
    return textField
  }()
  
  
  func initUI(){
    view.addSubview(names)
    names.addAnchorsAndCenter(centerX: true, centerY: false, width: 500, height: 50, left: nil, top: 90, right: nil, bottom: nil)
    
    
  }

}
