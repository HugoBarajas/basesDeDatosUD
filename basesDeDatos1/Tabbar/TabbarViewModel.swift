//
//  TabbarViewModel.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 13/02/24.
//

import Foundation
import UIKit

class TabbarViewModel{
  var coordinator : TabbarCoordinator?
  
  
  func getHomeController() -> UIViewController{
    return (coordinator?.getHomeController())!
  }
  
  
  
  func triste(){
    print(":(")
  }
}
