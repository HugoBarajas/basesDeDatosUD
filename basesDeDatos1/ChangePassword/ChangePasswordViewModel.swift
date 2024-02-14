//
//  ChangePasswordViewModel.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import Foundation

class ChangePasswordViewModel{
  
  var coordinator : ChangePasswordCoordinator!
  
  func goToLogin(){
    coordinator.goToLogin()
  }
}
