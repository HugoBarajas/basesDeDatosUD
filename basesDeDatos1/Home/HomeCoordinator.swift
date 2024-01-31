//
//  HomeCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = HomeViewController()
    let viewModel = HomeViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
  func goToLogin(){
    let coordinatorLogin = LoginCoordinator(navigationController: navigationController)
    childCoordinator.append(coordinatorLogin)
    coordinatorLogin.startCoordinator()
  }
  
  
}

