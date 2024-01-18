//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit




class RegisterViewController: UIViewController, UITextFieldDelegate {
  var viewModel : RegisterViewModel!

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
    
    var eyeImageView: UIImageView = {
     var imageView = UIImageView(image: UIImage(named: "ojito"))
     imageView.contentMode = .scaleAspectFit
     imageView.isHidden = true
      return imageView
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
                atributosTexto.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: terms)
            let estiloSubrayado = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            atributosTexto.addAttributes(estiloSubrayado, range: terms)
            let advice = (originalText as NSString).range(of: "Aviso de Privacidad")
                atributosTexto.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: advice)
            atributosTexto.addAttributes(estiloSubrayado, range: advice)
                termsLb.attributedText = atributosTexto
            termsLb.numberOfLines = 0
            termsLb.textAlignment = .center
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
initUI()
    
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
      
   
    view.addSubview(termisLabel)
            termisLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 100, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: passwordRequeriments)
            
      view.addSubview(createAccountButton)
            createAccountButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: termisLabel)

    
  }
    @objc func showPasswordButtonTapped() {
     password.isSecureTextEntry.toggle()
     confirmPassword.isSecureTextEntry.toggle()
     showPasswordButton.isSelected = !showPasswordButton.isSelected
       }
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
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
    
    if textField == email{
     
      let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
      return emailTest.evaluate(with: string)
      
    }
    
   
    
    return true
  }
    

}
