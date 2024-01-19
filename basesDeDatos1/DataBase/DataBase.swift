//
//  DataBase.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 18/01/24.
//

import Foundation



extension UserDefaults{
  func putUser(user : User){
    let jsonEncoder = JSONEncoder()
    if let userEncode = try? jsonEncoder.encode(user){
      self.set(userEncode, forKey: "user")
    }
  }
  
  
  func getUser() -> User?{
    if let data = self.data(forKey: "user"){
      let jsonDecoder = JSONDecoder()
      if let user = try? jsonDecoder.decode(User.self, from: data){
        return user
      }else{
        print("Error decoding user")
        return nil
      }
    }else{
      print("Error getting user")
      return nil
    }
  }
  
  
  func deleteUser(){
    self.removeObject(forKey: "user")
  }
}
