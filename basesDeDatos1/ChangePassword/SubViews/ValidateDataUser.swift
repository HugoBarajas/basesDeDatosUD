//
//  ValidateDataUser.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import UIKit

class ValidateDataUser: UIView {
  
  //let viewController = ChangePasswordViewController()
  
  var requirementChangeLabel : UILabel = {
    var label = UILabel()
    label.font = UIFont(name: "Arial Bold", size: 18)
    label.textAlignment = .center
    label.textColor = .black
    label.numberOfLines = 0
    label.backgroundColor = .clear
    label.text = "Para cambiar tu contraseña necesitamos estos datos:"
    
    return label
    
  }()
  
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
  
  var password : TextFieldCustom = {
    var textField = TextFieldCustom(placeholder: "Nueva contraseña", eyeVisibility: true)
    textField.isHidden = true
    
    return textField
    
  }()
  
  var confirmPassword : TextFieldCustom = {
    var textField = TextFieldCustom(placeholder: "Confirmar contraseña", eyeVisibility: true)
    textField.isHidden = true
    
    return textField
    
  }()
  
  var buttonDataOk : UIButton = {
    var button = UIButton()
    button.setTitle("Validar datos", for: .normal)
    button.layer.cornerRadius = 15
    button.backgroundColor = .red
    
    return button
    
  }()
  
  var buttonChangePassword : UIButton = {
    var button = UIButton()
    button.setTitle("Cambiar contraseña", for: .normal)
    button.layer.cornerRadius = 15
    button.backgroundColor = .red
    button.isHidden = true
    
    return button
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    
    self.addSubview(requirementChangeLabel)
    requirementChangeLabel.addAnchorsAndSize(width: nil, height: 50, left: 15, top: 0, right: 15, bottom: nil)
    
    self.addSubview(nameTextField)
    nameTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: requirementChangeLabel)
    
    self.addSubview(emailTextField)
    emailTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: nameTextField)
    
    self.addSubview(phoneTextField)
    phoneTextField.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: emailTextField)
    
    buttonDataOk.addTarget(self, action: #selector(validateData), for: .touchUpInside)
    self.addSubview(buttonDataOk)
    buttonDataOk.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: phoneTextField)
    
    self.addSubview(password)
    password.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView:  buttonDataOk)
    
    self.addSubview(confirmPassword)
    confirmPassword.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: password)
    
    buttonChangePassword.addTarget(self, action: #selector(validatePassword), for: .touchUpInside)
    self.addSubview(buttonChangePassword)
    buttonChangePassword.addAnchorsAndSize(width: nil, height: 35, left: 15, top: 15, right: 15, bottom: nil, withAnchor: .top, relativeToView: confirmPassword)
  }
  
  
  @objc func validateData(){
    
    let email = emailTextField.textFieldCustom.text
    let name = nameTextField.textFieldCustom.text
    let phone = phoneTextField.textFieldCustom.text
    
    if let user = DataBase.shared.getUserByEmail(email: email ?? ""){
      print(user)
      if user.email == email! && user.name == name! && user.number == phone!{
        print("validacion bien")
        password.isHidden = false
        confirmPassword.isHidden = false
        buttonChangePassword.isHidden = false
      }else{
        print("error en tus datos")
      }
    }else{
      print("usuario no encontrado")
    }
    
  }
  @objc func validatePassword(){
    
    if password.textFieldCustom.text == confirmPassword.textFieldCustom.text{
      if var user = DataBase.shared.getUserByEmail(email: emailTextField.textFieldCustom.text ?? ""){
        print(user)
        user.password = password.textFieldCustom.text
        print(user)
        let newUser : User = User(id: user.id!, user: user.user!, name: user.name!, number: user.number!, email: user.email!, password: password.textFieldCustom.text!, isActive: true)
        
        print("nuevo usuario:\(newUser)")
        
        DataBase.shared.registerUser(user: newUser)
        print("ahora el user es\(newUser)")
  
      }else{
        print("usuario no encontrado")
      }
    }else{
      print("los campos de tu contraseña no son iguales")
    }
  }
  
  
  
}
