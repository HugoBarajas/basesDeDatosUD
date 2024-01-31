//
//  LoginViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import UIKit

class LoginViewController: UIViewController {
  
  let dataBase = DataBase.shared
  var viewModel : LoginViewModel!
  var userTextField : TextFieldCustom?
  var paswordTextField : TextFieldCustom?
  var checkMark : CheckMarkCustom?
  
  var login: UILabel = {
    var label = UILabel()
    label.text = " Iniciar Sesion"
    label.font = UIFont(name: "Optima", size: 30)
    label.font = UIFont.boldSystemFont(ofSize: 30)
    return label
  }()
  
  var imageIcon : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "ingenio")
    return image
  }()
  
  var loginButton : UIButton = {
    var button = UIButton()
    button.setTitle("Iniciar Sesion", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .systemYellow
    button.layer.cornerRadius = 20
    return button
  }()
  
  var passwordForget: UIButton = {
    var password = UIButton()
    password.setTitle("¿Olvidaste tu contraseña?", for: .normal)
    password.titleLabel?.font = UIFont(name: "Arial", size: 12)
    password.setTitleColor(.blue, for: .normal)
    return password
  }()
  
  var registerlog : UIButton = {
    var registerButton = UIButton()
    registerButton.setTitle("Ir a Registro", for: .normal)
    registerButton.setTitleColor(.black, for: .normal)
    registerButton.backgroundColor = .white
    registerButton.layer.cornerRadius = 10
    return registerButton
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    initUI()
  }
  
  func initUI(){
    
    
    view.addSubview(imageIcon)
    imageIcon.addAnchorsAndCenter(centerX:true , centerY: false, width: 150, height: 150, left: nil, top: 60, right: nil, bottom: nil)
    
    view.addSubview(login)
    login.addAnchorsAndCenter(centerX: true, centerY: false, width: 200, height: 30, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: imageIcon)
    
    userTextField = TextFieldCustom(placeholder: "Correo Electrónico", eyeVisibility: false, typeTextField: .emailAddress)
    view.addSubview(userTextField!)
    userTextField!.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: login)
    
    paswordTextField = TextFieldCustom(placeholder: "Contraseña", eyeVisibility: true)
    view.addSubview(paswordTextField!)
    paswordTextField!.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 35, right: nil, bottom: nil, withAnchor: .top, relativeToView: userTextField)
    
    passwordForget.addTarget(self, action: #selector(goToChangePassword), for: .touchUpInside)
    view.addSubview(passwordForget)
    passwordForget.addAnchorsAndSize(width: 200, height: 12, left: 0, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: paswordTextField)
    
    checkMark = CheckMarkCustom(labelCheckMark: "Seguir Conectado", checkVisibility: false)
    checkMark?.isUserInteractionEnabled = true
    view.addSubview(checkMark!)
    checkMark!.addAnchorsAndSize(width: 200, height: 20, left: nil, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: passwordForget)
    
    
    loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    view.addSubview(loginButton)
    loginButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 100, height: 40, left: nil, top: 80, right: nil, bottom: nil,withAnchor: .top, relativeToView: checkMark)
    
    registerlog.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    view.addSubview(registerlog)
    registerlog.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 100, height: 30, left: nil, top: 30, right: nil, bottom: nil, withAnchor: .top, relativeToView: loginButton)
    
  }
  
  @objc func loginAction(){
    print("Login")
    let usuarioTF = userTextField?.textFieldCustom.text?.lowercased()
    let paswordTF = paswordTextField?.textFieldCustom.text
    let iOSVersion = UIDevice.current.systemVersion
    
    if !userTextField!.isValidEmail() || paswordTF!.count < 6 {
      let chaleAction = UIAlertAction(title: "Intentar de nuevo", style: .destructive){ _ in
        print("Credenciales incorrectas")
      }
      alerta(titulo: "Error en las credenciales", mensaje: "Tus credenciales parecen ser incorrectas", actions: [chaleAction])
      return
    }
    
    
    //AQUI si se ingreso un email y un password
    if let user = dataBase.getUserByEmail(email: usuarioTF ?? ""){
      // Aqui sabemos que el email si esta registrado
      if usuarioTF == user.email && paswordTF == user.password{
        dataBase.userLogged(user: user)
        viewModel.goToHome()
      }else{
        
        let chaleAction = UIAlertAction(title: "Intentar de nuevo", style: .destructive){ _ in
          print("Credenciales incorrectas")
        }
        alerta(titulo: "Error en las credenciales", mensaje: "Tus credenciales parecen ser incorrectas", actions: [chaleAction])
      }
  
    }else{
      let chaleAction = UIAlertAction(title: "OK", style: .destructive){ _ in
        print("Usuario no encontrado")
      }
      alerta(titulo: "Error al iniciar sesion", mensaje: "Usuario no encontrdo", actions: [chaleAction])
    }
    
  }
  
  
  func validateLogin(){
    
  }
  
  
  func alerta(titulo : String, mensaje : String, actions : [UIAlertAction]){
    let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
    for action in actions {
      alert.addAction(action)
    }
    present(alert, animated:  true)
    
    
    
  }
  
  func savePassword(password: String){
    UserDefaults.standard.setValue(password, forKey: "passwordSaved")
    print("Se almanceno")
  }
  
  func getDateNow() -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    
    let currentDate = Date()
    let formattedDate = dateFormatter.string(from: currentDate)
    
    print("Fecha formateada: \(formattedDate)")
    
    return formattedDate
  }
  
  @objc func registerAction(){
    viewModel.goToRegister()
  }
  
  @objc func goToChangePassword(){
    viewModel.goToChangePassword()
  }
}


/*
 UserDefaults es una herramienta nativa que nos ayuda a almacenar datos o informacion de manera local, siendo persistente en el dispositivo
 
 
 
 
 
 
 */
