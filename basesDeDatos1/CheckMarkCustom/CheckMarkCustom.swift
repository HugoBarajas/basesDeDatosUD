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
    var isCheckMark: Bool = false
    
    var checkMarkButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
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
        
        self.addSubview(nameCheck)
        nameCheck.addAnchors(left: 30, top: 0, right: 0, bottom: nil)
        
        nameCheck.text = labelCheckMark
        checkMarkButton.addTarget(self, action: #selector(checkMark), for: .touchUpInside)
        self.addSubview(checkMarkButton)
        checkMarkButton.addAnchorsAndSize(width: 20, height: 20, left: nil, top: 0, right: 5, bottom: nil, withAnchor: .right, relativeToView: nameCheck)
    }
    
    @objc func checkMark(){
        isCheckMark.toggle()
        isCheckMark ? checkMarkButton.setImage(UIImage(named: "checkMark"), for: .normal) : checkMarkButton.setImage(nil, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
