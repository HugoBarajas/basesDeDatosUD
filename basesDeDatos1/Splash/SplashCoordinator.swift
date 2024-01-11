//
//  SplashCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import Foundation
import UIKit

class SplashCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = SplashViewController()
    let viewModel = SplashViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.setViewControllers([view], animated: true)
  }
  func goToLogin(){
    let coordinatorLogin = LoginCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorLogin)
    coordinatorLogin.startCoordinator()
  }
  
  func goToHome(){
    let coordinatorLogin = HomeCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorLogin)
    coordinatorLogin.startCoordinator()
  }
  
}
