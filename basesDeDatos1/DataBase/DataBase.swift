//
//  DataBase.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 18/01/24.
//

import Foundation



extension UserDefaults{
  func putData<T:Encodable>(object : T, key : String){
    let jsonEncoder = JSONEncoder()
    if let userEncode = try? jsonEncoder.encode(object){
      self.set(userEncode, forKey: key)
    }
  }
  
  func getData<T : Decodable>(type : T.Type, key : String) -> T?{
    if let data = self.data(forKey: key){
      let jsonDecoder = JSONDecoder()
      if let user = try? jsonDecoder.decode(type, from: data){
        return user
      }else{
        print("Error decoding data")
        return nil
      }
    }else{
      print("Error getting data")
      return nil
    }
  }
  
  func deleteData(key : String){
    self.removeObject(forKey: key)
  }
}
