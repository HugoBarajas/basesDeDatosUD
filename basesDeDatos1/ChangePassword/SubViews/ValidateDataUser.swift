//
//  ValidateDataUser.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import UIKit

class ValidateDataUser: UIView {
  
  var nameTextField : TextFieldCustom = {
    var textField = TextFieldCustom(placeholder: "Nombre de usuario", eyeVisibility: false)
    
    return textField
    
  }()
  
  var emailTextField : TextFieldCustom = {
    var textField = TextFieldCustom(placeholder: "Correo electronico", eyeVisibility: false)
    
    return textField
    
  }()
  
  var phoneTextField : TextFieldCustom = {
    var textField = TextFieldCustom(placeholder: "Número telefónico", eyeVisibility: false)
    
    return textField
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    self.addSubview(nameTextField)
    nameTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 0, right: 15, bottom: nil)
    
    self.addSubview(emailTextField)
    emailTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: nameTextField)
    
    self.addSubview(phoneTextField)
    phoneTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: emailTextField)
  }
  
}
