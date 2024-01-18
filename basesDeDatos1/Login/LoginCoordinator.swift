//
//  LoginCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import Foundation
import UIKit

class LoginCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  func startCoordinator() {
    let view = LoginViewController()
    let viewModel = LoginViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.setViewControllers([view], animated: true)
  }
  
  func goToHome(){
    let coordinatorLogin = HomeCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorLogin)
    coordinatorLogin.startCoordinator()
  }
  
  func goToRegister(){
    let coordinatorRegister = RegisterCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorRegister)
    coordinatorRegister.startCoordinator()
    
  }
}
