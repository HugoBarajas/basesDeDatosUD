//
//  CheckMarkCustom.swift
//  basesDeDatos1
//
//  Created by Vìctor Rmz on 17/01/24.
//

import UIKit

class CheckMarkCustom: UIView {
    
    let labelCheckMark : String?
    let checkVisibility : Bool?
    
    var checkMarkButton: UIButton = {
        var button = UIButton()
        //button.setImage(UIImage(named: "checkMark"), for: .normal)
        //button.tintColor = .black
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        return button
    }()
    
    var nameCheck: UILabel = {
        var nameCheck = UILabel()
        return nameCheck
    }()
    
    init(labelCheckMark: String, checkVisibility: Bool){
        self.labelCheckMark = labelCheckMark
        self.checkVisibility = checkVisibility
        super.init(frame: .zero)
        initUI()
    }
    
    func initUI(){
        self.addSubview(checkMarkButton)
        checkMarkButton.addAnchorsAndSize(width: 20, height: 20, left: 0, top: 0, right: nil, bottom: nil)
        
        nameCheck.text = labelCheckMark
        self.addSubview(nameCheck)
        nameCheck.addAnchors(left: 0, top: 0, right: nil, bottom: nil, withAnchor: .left, relativeToView: checkMarkButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
