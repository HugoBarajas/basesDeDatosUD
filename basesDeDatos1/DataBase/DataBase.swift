//
//  DataBase.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 18/01/24.
//

import Foundation

// Singleton
// Patron de diseño
/*
 Es un patron que su principal estructura esta basada en que solo existe un objeto de el mismo 
 
 */

class DataBase{
  static let shared = DataBase()
  let userDefaults = UserDefaults.standard
  
  func getUsers() -> [User]{
    if let users = userDefaults.getData(type: [User].self, key: UserDefaultsKeys.users.rawValue){
      return users
    }
    return []
  }
  
  func getActiveUsers() -> [User]{
    let users = getUsers()
    let activeUsers = users.filter({$0.isActive!})
    return activeUsers
  }
  
  func registerUser(user : User){
    var users = getUsers()
    users.append(user)
    userDefaults.putData(object: users, key: UserDefaultsKeys.users.rawValue)
  }
  
  func deleteUser(user : User){
    var users = getUsers()
    if let index = users.firstIndex(where: {$0.id == user.id}){ // Closure
      users[index].isActive = false
      userDefaults.putData(object: users, key: UserDefaultsKeys.users.rawValue)
    }
  }
  
  func userLogged(user : User){
    userDefaults.putData(object: user, key: UserDefaultsKeys.userLogged.rawValue)
  }
  
  func getUserLogged() -> User?{
    userDefaults.getData(type: User.self, key: UserDefaultsKeys.userLogged.rawValue)
  }
  
  func getUserByEmail(email : String) -> User?{
    let users = getUsers()
    let filteredUser = users.filter({$0.email == email})
    guard let user = filteredUser.first else { return nil }
    return user
  }
    
    func getUserByNumber(number : String) -> User?{
      let users = getUsers()
      let filteredUser = users.filter({$0.number == number})
      guard let user = filteredUser.first else { return nil }
      return user
    }
  
  func loggout(){
    userDefaults.deleteData(key: UserDefaultsKeys.userLogged.rawValue)
  }
}

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
    print("Delete data: \(key)")
  }
}
