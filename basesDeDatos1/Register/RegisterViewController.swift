//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit




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
    
    var lastName : UITextField = {
      var textField = UITextField()
      textField.placeholder = "Apellido Paterno"
      textField.backgroundColor = .white
      return textField
    }()
    
    var mothersMaidenName : UITextField = {
      var textField = UITextField()
      textField.placeholder = "Apellido Materno"
      textField.backgroundColor = .white
      return textField
    }()
  
    var phoneNumberTextField : UITextField = {
        var pNumberTF = UITextField()
        pNumberTF.placeholder = "Telefono Celular"
        pNumberTF.keyboardType = .numberPad
        pNumberTF.backgroundColor = .white
        return pNumberTF
    }()
    
  func initUI(){
    view.addSubview(names)
    names.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 90, right: nil, bottom: nil)
      
      view.addSubview(lastName)
      lastName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: names)
      
      view.addSubview(mothersMaidenName)
      mothersMaidenName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: lastName)
    
      view.addSubview(phoneNumberTextField)
      phoneNumberTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: mothersMaidenName)
    
  }

}
