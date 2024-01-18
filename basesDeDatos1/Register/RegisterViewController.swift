//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit




class RegisterViewController: UIViewController {
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .red
initUI()
      
    }
    
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

    
  func initUI(){
    view.addSubview(names)
    names.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 90, right: nil, bottom: nil)
      
      view.addSubview(lastName)
      lastName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: names)
      
      view.addSubview(mothersMaidenName)
      mothersMaidenName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: lastName)
    
      view.addSubview(phoneNumberTextField)
      phoneNumberTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: mothersMaidenName)

      view.addSubview(email)
      email.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: phoneNumberTextField)
      
      view.addSubview(password)
      password.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: email)
      
      view.addSubview(confirmPassword)
      confirmPassword.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: password)
      
   
     /*  view.addSubview(termisLabel)
            termisLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 100, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: promotions)
            
            view.addSubview(createAccountButton)
            createAccountButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: termisLabel)*/

    
  }
    @objc func showPasswordButtonTapped() {
     password.isSecureTextEntry.toggle()
     confirmPassword.isSecureTextEntry.toggle()
     showPasswordButton.isSelected = !showPasswordButton.isSelected
       }
    
    

}
