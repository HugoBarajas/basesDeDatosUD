//
//  RegisterViewController.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import UIKit




class RegisterViewController: UIViewController, UITextFieldDelegate {
  var buttomTapped = false
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
  
  var passwordRequirements : UITextView = {
    var textView = UITextView()
    textView.backgroundColor = .clear
    textView.textColor = .white
    textView.font = UIFont(name: "Arial Bold", size: 15)
    textView.text = "Debe de contener minimo 8 caracteres, al menos una letra mayusacula y un numero, no podras utilizar una contraseña anterior, asi como contraseñas faciles de adivinar (ejemplo: 123456.)"
    
    return textView
  }()
  
  var optionalLabelPromotions : UILabel = {
    var label = UILabel()
    label.backgroundColor = .white
    label.layer.cornerRadius = 2
    label.layer.borderWidth = 1
    label.layer.borderColor = UIColor.gray.cgColor
    
    return label
    }()
  
  var promotions : UITextView = {
    var textView = UITextView()
    textView.backgroundColor = .clear
    textView.textColor = .white
    textView.font = UIFont(name: "Arial Bold", size: 15)
    textView.text = "Deseo recibir promociones exclusivas por correo"
    
    return textView
  }()
  
  
  func initUI(){
    view.addSubview(names)
    names.delegate = self
    names.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 90, right: nil, bottom: nil)
      
      view.addSubview(lastName)
    lastName.delegate = self
      lastName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: names)
      
      view.addSubview(mothersMaidenName)
      mothersMaidenName.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: lastName)
    
      view.addSubview(phoneNumberTextField)
    phoneNumberTextField.delegate = self
      phoneNumberTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: mothersMaidenName)
    
    view.addSubview(passwordRequirements)
    passwordRequirements.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 90, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: phoneNumberTextField)
    
    view.addSubview(optionalLabelPromotions)
    optionalLabelPromotions.addAnchorsAndSize(width: 18, height: 18, left: 5, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: passwordRequirements)
    
    view.addSubview(promotions)
    promotions.addAnchorsAndSize(width: nil, height: 36, left: 25, top: 13, right: 5, bottom: nil,withAnchor: .top, relativeToView: passwordRequirements)
    
  }
  
  func textField(_ textField1: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          // Permitir solo números y un solo punto decimal
    /*
    let maxLength : Int
    
    if textField1 == lastName || textField1 == names  {
      maxLength = 8
      let currentString: NSString = textField1.text! as NSString
              
              let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
              return newString.length <= maxLength
    }
    */
    
    if textField1 == phoneNumberTextField{
      let allowedCharacters = CharacterSet.decimalDigits
      let characterSet = CharacterSet(charactersIn: string)
      return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
    return true
      }

  
}
