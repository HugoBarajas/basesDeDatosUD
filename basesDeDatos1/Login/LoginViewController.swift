//
//  LoginViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class LoginViewController: UIViewController {

  
  var viewModel : LoginViewModel!
  let user = "Ingenio"
  let password = "1234"
  
  var userTextField : UITextField = {
    var textField = UITextField()
    textField.placeholder = "Usuario"
    textField.backgroundColor = .white
    return textField
  }()
  
  var paswordTextField : UITextField = {
    var textField = UITextField()
    textField.placeholder = "Contraseña"
    textField.backgroundColor = .white
    textField.isSecureTextEntry = true //propiedad que hace que no se vean los caracteres   que se escriben en el textField
    return textField
  }()
  
  var loginButton : UIButton = {
    var button = UIButton()
    button.setTitle("Iniciar Sesion", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 10
    return button
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .blue
      initUI()
    }
    
  func initUI(){
    view.addSubview(userTextField)
    userTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 100, right: nil, bottom: nil)
    
    view.addSubview(paswordTextField)
    paswordTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: userTextField)
    
    loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    view.addSubview(loginButton)
    loginButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 100, height: 30, left: nil, top: 80, right: nil, bottom: nil,withAnchor: .top, relativeToView: paswordTextField)
    
  }
  
  @objc func loginAction(){
    print("Login")
    let usuarioTF = userTextField.text
    let paswordTF = paswordTextField.text
    
    if usuarioTF == user && paswordTF == password{
      

       print("Ir al home")
        viewModel.goToHome()
     
      
      
    }else{
      
      let chaleAction = UIAlertAction(title: "Chale", style: .destructive){ _ in
        print("Matar la app")
      }
      
      let resetAction = UIAlertAction(title: "Recuperar contraseña", style: .default){_ in
        print("Ir al reset de la contraseña")
      }
      
      alerta(titulo: "Error en el inicio de sesion", mensaje: "Tus credenciales parecen ser incorrectas", actions: [chaleAction, resetAction])
      
      userTextField.text = ""
      paswordTextField.text = ""
      
    }
  }

  
  func alerta(titulo : String, mensaje : String, actions : [UIAlertAction]){
    let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
    for action in actions {
      alert.addAction(action)
    }
    present(alert, animated:  true)
    
  
  }
  

}

