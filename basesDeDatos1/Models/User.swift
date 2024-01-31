//
//  User.swift
//  basesDeDatos1
//
//  Created by Angel Duarte on 18/01/24.
//

import Foundation

struct User : Codable{
  var id : Int?
  var user : String?
  var name : String?
  var number : String?
  var email : String?
  var password : String?
  var isActive : Bool?
  var gender: String? = "Female"
}
