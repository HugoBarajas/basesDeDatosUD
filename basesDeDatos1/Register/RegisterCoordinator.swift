//
//  RegisterCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 16/01/24.
//

import Foundation
import UIKit


class RegisterCoordinator : Coordinator {
  var childCoordinator: [Coordinator] = []
  
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  func startCoordinator() {
   let view = RegisterViewController()
   let viewModel = RegisterViewModel()
  viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.setViewControllers([view], animated: true)
  
    
  }
    
    
  

}
