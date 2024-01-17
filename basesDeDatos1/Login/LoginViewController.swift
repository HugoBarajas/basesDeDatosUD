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
    
    var userTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Correo electronico"
        textField.backgroundColor = .white
        return textField
    }()
    
    var paswordTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Contraseña"
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        //propiedad que hace que no se vean los caracteres   que se escriben en el textField
        return textField
    }()
     
    var viewPasswordButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "eye-close"), for: .normal)
        button.tintColor = .black
        return button
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
        
        view.addSubview(userTextField)
        userTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: login)
        
        view.addSubview(paswordTextField)
        paswordTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 50, height: 35, left: nil, top: 35, right: nil, bottom: nil, withAnchor: .top, relativeToView: userTextField)
        
        view.addSubview(viewPasswordButton)
        viewPasswordButton.addAnchorsAndSize(width: 30, height: 30, left: nil, top: nil, right: 20, bottom: nil)
        viewPasswordButton.addAnchors(left: nil, top: 37.5, right: nil, bottom: nil, withAnchor: .top, relativeToView: userTextField)
        viewPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        view.addSubview(passwordForget)
        passwordForget.addAnchorsAndSize(width: 200, height: 12, left: 0, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: paswordTextField)
        
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 100, height: 40, left: nil, top: 80, right: nil, bottom: nil,withAnchor: .top, relativeToView: passwordForget)
        
    }
    
    @objc func loginAction(){
        print("Login")
        let usuarioTF = userTextField.text
        let paswordTF = paswordTextField.text
        let iOSVersion = UIDevice.current.systemVersion
        
        if usuarioTF == user && paswordTF == password{
            savePassword(password: paswordTF ?? "")
            
            UserDefaults.standard.setValue(usuarioTF, forKey: "usuariosalvado")
            UserDefaults.standard.setValue(true, forKey: "isLogged")
            UserDefaults.standard.setValue(iOSVersion, forKey: "iOSVersion")
            
            UserDefaults.standard.setValue(UIDevice.current.batteryLevel, forKey: "bateryLevel")
            UserDefaults.standard.setValue(getDateNow(), forKey: "dateLoggged")
            
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
    @objc func togglePasswordVisibility(){
        
        let imageName = paswordTextField.isSecureTextEntry ? "eye-open" : "eye-close"
        let imageEye = UIImage(named: imageName)
        viewPasswordButton.setImage(imageEye, for: .normal)
        
        paswordTextField.isSecureTextEntry.toggle()
        
        
    }
    
}

/*
 UserDefaults es una herramienta nativa que nos ayuda a almacenar datos o informacion de manera local, siendo persistente en el dispositivo
 
 
 
 
 
 
 */
