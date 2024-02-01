//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
  var viewModel : RegisterViewModel!
  
  let dataBase = DataBase.shared

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
    
    var email : UITextField = {
      var textField = UITextField()
      textField.placeholder = "Correo electrónico"
      textField.backgroundColor = .white
      textField.keyboardType = .emailAddress
      return textField
    }()
    
    var password: UITextField = {
     var textField = UITextField()
     textField.placeholder = "Contraseña"
     textField.isSecureTextEntry = true
     textField.backgroundColor = .white
     return textField
        }()

    var confirmPassword: UITextField = {
      var textField = UITextField()
      textField.placeholder = "Confirmar contraseña"
      textField.isSecureTextEntry = true
      textField.backgroundColor = .white
      return textField
        }()

    var showPasswordButton: UIButton = {
     var button = UIButton()
     button.setTitle("Mostrar", for: .normal)
     button.setTitle("Ocultar", for: .selected)
     button.setTitleColor(.blue, for: .normal)
     button.addTarget(RegisterViewController.self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
     
     return button
        }()
    
    /*var eyeImageView: UIImageView = {
     var imageView = UIImageView(image: UIImage(named: "ojito"))
     imageView.contentMode = .scaleAspectFit
     imageView.isHidden = false
     imageView.tintColor = .black
      return imageView */
    
    var eyeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "ojito"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
        
    }()
        
        var eyeButton2: UIButton = {
            var button = UIButton()
            button.setImage(UIImage(named: "ojito"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.addTarget(self, action: #selector(showPasswordButtonTappedConfirmPassword), for: .touchUpInside)
            return button
       
    }()
        
  
    var phoneNumberTextField : UITextField = {
        var pNumberTF = UITextField()
        pNumberTF.placeholder = "Telefono Celular"
        pNumberTF.keyboardType = .numberPad
        pNumberTF.backgroundColor = .white
        return pNumberTF
    }()
    

  var passwordRequeriments : UITextView = {
    var textView = UITextView()
    textView.backgroundColor = .clear
    textView.textColor = .white
    textView.font = UIFont(name: "Arial Bold", size: 15)
    textView.text = "Debe contener minimo 8 caracteres, al menos una letra mayuscula y un numero, no podras utilizar una cotraseña anterior, asi como contraseñas faciles de adivinar (ejemplo: 123456)"
    
    return textView
  }()
  
    
    var termisLabel : UILabel = {
            var termsLb = UILabel()
            let originalText = "Al registrarte aceptas los Términos y Condiciones y Aviso de Privacidad de Ingenio"
            let atributosTexto = NSMutableAttributedString(string: originalText)
            let terms = (originalText as NSString).range(of: "Términos y Condiciones")
                atributosTexto.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: terms)
            let estiloSubrayado = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            atributosTexto.addAttributes(estiloSubrayado, range: terms)
            let advice = (originalText as NSString).range(of: "Aviso de Privacidad")
                atributosTexto.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: advice)
            atributosTexto.addAttributes(estiloSubrayado, range: advice)
                termsLb.attributedText = atributosTexto
            termsLb.numberOfLines = 0
            termsLb.textAlignment = .center
            termsLb.textColor = .white
            return termsLb
        }()
        
        var createAccountButton : UIButton = {
            var accountBtn = UIButton()
            accountBtn.setTitle("Crear Cuenta", for: .normal)
            accountBtn.setTitleColor(.black, for: .normal)
            accountBtn.backgroundColor = .white
            accountBtn.layer.cornerRadius = 25
            return accountBtn
        }()

    
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .red
      names.delegate = self
      lastName.delegate = self
      mothersMaidenName.delegate = self
      initUI()
      view.backgroundColor = .gray
    initUI()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = false
  }
  
  
  
  func initUI(){
      
      
    view.addSubview(names)
    names.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 90, right: nil, bottom: nil)
      
      view.addSubview(lastName)
      lastName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: names)
      
      view.addSubview(mothersMaidenName)
      mothersMaidenName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: lastName)
    
      view.addSubview(phoneNumberTextField)
    phoneNumberTextField.delegate = self
      phoneNumberTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: mothersMaidenName)

      view.addSubview(email)
    email.delegate = self
      email.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: phoneNumberTextField)
      view.addSubview(password)

      password.delegate = self
      password.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: email)
      
      view.addSubview(confirmPassword)
      confirmPassword.delegate = self
      confirmPassword.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: password)
    
    
    view.addSubview(passwordRequeriments)
    passwordRequeriments.addAnchorsAndSize(width: width - 10, height: 100, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top, relativeToView: confirmPassword)

      password.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: email)

      view.addSubview(confirmPassword)
      confirmPassword.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: password)
      

      view.addSubview(eyeButton)
         eyeButton.addAnchorsAndCenter(centerX: false, centerY: false, width: 30, height: 30, left: nil, top: 15, right: 40, bottom: nil, withAnchor: .top, relativeToView: email)

         view.addSubview(showPasswordButton)
         showPasswordButton.addAnchorsAndCenter(centerX: true, centerY: false, width: 80, height: 30, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .left, relativeToView: confirmPassword)
         
   
      confirmPassword.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: password)
      view.addSubview(eyeButton2)
      
      
      eyeButton2.addAnchorsAndCenter(centerX: false, centerY: false, width: 30, height: 30, left: nil, top: 15, right: 40, bottom: nil, withAnchor: .top, relativeToView: password)
      

      
   
    view.addSubview(termisLabel)
            termisLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 100, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: passwordRequeriments)
       
    createAccountButton.addTarget(self, action: #selector(textFieldValidation), for: .touchUpInside)
      view.addSubview(createAccountButton)
            createAccountButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: termisLabel)

    
  }
    @objc func showPasswordButtonTapped() {
     password.isSecureTextEntry.toggle()
     showPasswordButton.isSelected = !showPasswordButton.isSelected
        eyeButton.setImage(UIImage(named: showPasswordButton.isSelected ? "ojitocerrado" : "ojitoabierto"), for: .normal)
        }
       
    @objc func showPasswordButtonTappedConfirmPassword() {
        confirmPassword.isSecureTextEntry.toggle()
        showPasswordButton.isSelected = !showPasswordButton.isSelected
        eyeButton2.setImage(UIImage(named: showPasswordButton.isSelected ? "ojitocerrado" : "ojitoabierto"), for: .normal)
    }
    

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
      if textField == names || textField == lastName || textField == mothersMaidenName{

          
          let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
          let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
          let typedCharacterSet = CharacterSet(charactersIn: string)
          let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
    
          return alphabet
      }
    
    let maxLength : Int
    
    if textField == password || textField == confirmPassword{
      
      maxLength = 6
      let currentString: NSString = textField.text! as NSString
              
      let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
      
      return newString.length <= maxLength
    }
    
    if textField == phoneNumberTextField{
      let allowedCharacters = CharacterSet.decimalDigits
      let characterSet = CharacterSet(charactersIn: string)
      return allowedCharacters.isSuperset(of: characterSet)
    }
    return true
  }

  
  @objc func textFieldValidation(){
    let email1 = email.text
    let name = names.text
    let lastName1 = lastName.text
    let lastName2 = mothersMaidenName.text
    let number = phoneNumberTextField.text
    let password1 = password.text
    let pasword2 = confirmPassword.text
     
    
    if (email1?.isEmpty ?? true) || (name?.isEmpty ?? true) || (lastName1?.isEmpty ?? true) || (lastName2?.isEmpty ?? true) || (number?.isEmpty ?? true) || (password1?.isEmpty ?? true) || (pasword2?.isEmpty ?? true) {
      
      let alert = UIAlertController(title: "Alguno de tus campos está vacío", message: "", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default))
      present(alert, animated: true)
    } else {
        print("todo cool aun")
        
        let regex = try! NSRegularExpression(pattern: "^[0-9]{10}$", options: .caseInsensitive)
        let matches = regex.matches(in: number ?? "", options: [], range: NSRange(location: 0, length: number?.utf16.count ?? 0))
                if matches.count > 0 {
                    print("Número de teléfono válido")
                } else {
                    print("Número de teléfono no válido")
                    let alert = UIAlertController(title: "Error ingresando teléfono", message: "El número de teléfono ingresado no es válido", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    present(alert, animated: true)
                }
        
        
        if let _ = dataBase.getUserByEmail(email: email1 ?? ""), let campos = dataBase.getUserByNumber(number: number ?? ""){
            
        let alert = UIAlertController(title: "Error creando usuario", message: "Email ya registrado, usa otro porfi", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
      }else {
        
        let dataBaseUsers = dataBase.getUsers()
        let user = User(id: dataBaseUsers.count + 1, user: name, name: lastName1, number: number, email: email1,password: password1, isActive: true)
        
        dataBase.registerUser(user: user)
        dataBase.userLogged(user: user)
        
        viewModel.goToHome()
      }
    }
    
    if isValidEmail(email: email1!){

    }else{
      var alert = UIAlertController(title: "tu correo es incorrecto", message: "", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default))
      present(alert, animated: true)
    }
      
  }
  
  func isValidEmail(email: String) -> Bool {
          let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
          let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
          return emailPredicate.evaluate(with: email)
      }

}

