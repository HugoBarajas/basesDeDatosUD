//
//  TabbarController.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 13/02/24.
//

import UIKit

class TabbarController: UITabBarController {
  
  var viewModel : TabbarViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      
     // viewModel!.triste()
      
     
    }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    setUpControllers()
  }
  
  func setUpControllers(){
    
    var vcs = [UIViewController]()
    
    if let home = viewModel?.getHomeController(){
      home.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
      
      vcs.append(home)
    } // Controlador de home
    
    
    let dashboard = DashboardViewController() // Controlador de Dasboard
    dashboard.tabBarItem = UITabBarItem(title: "Dash", image: nil, tag: 1)
    
    vcs.append(dashboard)
    
    viewControllers = vcs


    
  }
    
}
