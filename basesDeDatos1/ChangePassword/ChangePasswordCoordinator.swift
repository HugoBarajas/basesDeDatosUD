//
//  ChangePasswordCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 30/01/24.
//

import Foundation
import UIKit

class ChangePasswordCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController: UINavigationController) {
  
    self.navigationController = navigationController
  }
  
  func startCoordinator() {
    let view = ChangePasswordViewController()
    let viewModel = ChangePasswordViewModel()
    view.viewModel = viewModel
    viewModel.coordinator = self
    navigationController.pushViewController(view, animated: true)
  }
  
  func goToLogin(){
    let coordinatorLogin = LoginCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorLogin)
    coordinatorLogin.startCoordinator()
  }
  
}
