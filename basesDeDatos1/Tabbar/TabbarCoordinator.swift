//
//  TabbarCoordinator.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 13/02/24.
//

import Foundation
import UIKit

class TabbarCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  func startCoordinator() {
    let view = TabbarController()
    let viewModel = TabbarViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
  
  func getHomeController() -> UIViewController{
    let homeCoordinator = HomeCoordinator(navigationController: navigationController)
    return homeCoordinator.createModule()
  }
  
  
}
