//
//  TextFieldCustom.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Martinez Ramirez on 17/01/24.
//

import UIKit

class TextFieldCustom: UIView {
    
    var placeholder: String?
    var eyeVisibility: Bool?
    var typeTextField: UITextContentType?
    
    var textFieldCustom: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .white
        return textField
    }()
    var viewPasswordButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "eye-close"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    init(placeholder: String, eyeVisibility: Bool, typeTextField: UITextContentType? = nil){
        self.placeholder = placeholder
        self.eyeVisibility = eyeVisibility
        self.typeTextField = typeTextField
        super.init(frame: .zero)
        initUI()
    }
    
    func initUI(){
        
        self.addSubview(textFieldCustom)
        textFieldCustom.placeholder = placeholder
        if typeTextField != nil {
            textFieldCustom.textContentType = typeTextField
        }
        textFieldCustom.addAnchorsWithMargin(0)
        
        if eyeVisibility! {
            viewEye()
        }
        
        let viewLine = UIView()
        viewLine.backgroundColor = .systemGray
        self.addSubview(viewLine)
        viewLine.addAnchorsAndSize(width: nil, height: 1, left: 0, top: 0, right: 0, bottom: nil, withAnchor: .top, relativeToView: textFieldCustom)
    }
    
    func viewEye(){
      
      let texto = textFieldCustom.text
        
        textFieldCustom.isSecureTextEntry = true
        
        self.addSubview(viewPasswordButton)
        viewPasswordButton.addAnchorsAndCenter(centerX: nil, centerY: true, width: 30, height: 30, left: nil, top: nil, right: 5, bottom: nil)
        viewPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    @objc func togglePasswordVisibility(){
        
        let imageName = textFieldCustom.isSecureTextEntry ? "eye-open" : "eye-close"
        let imageEye = UIImage(named: imageName)
        viewPasswordButton.setImage(imageEye, for: .normal)
        
        textFieldCustom.isSecureTextEntry.toggle()
        
        
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = #"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let value = emailPred.evaluate(with: textFieldCustom.text)
        return value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
