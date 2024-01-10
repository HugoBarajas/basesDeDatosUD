//
//  AppCoordinator.swift
//  basesDeDatos1
//
//  Created by Victor Hugo Barajas Santibañez on 09/01/24.
//

import Foundation
import UIKit


protocol Coordinator{
  var childCoordinator : [Coordinator] {get set}//get obtener su valor, set asignarle un valor
  func startCoordinator()
}

class AppCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var window : UIWindow
  
  init(window : UIWindow){
    self.window = window
  }
  
  
  func startCoordinator() {
let navigationController = UINavigationController()
    let splashCoordinator = SplashCoordinator(navigationController : navigationController )
    childCoordinator.append(splashCoordinator)
    splashCoordinator.startCoordinator()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  
}
