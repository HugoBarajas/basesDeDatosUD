//
//  LoginViewModel.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import Foundation

class LoginViewModel{
  
  var coordinator : LoginCoordinator!
 
  func goToHome(){
    coordinator.goToHome()
  }
  
  func goToRegister(){
    coordinator.goToRegister()
  }
  
  func goToChangePassword(){
    coordinator.goToChangePassword()
  }

}
