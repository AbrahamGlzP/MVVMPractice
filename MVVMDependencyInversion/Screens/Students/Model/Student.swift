//
//  Student.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import Foundation

typealias Students = [Student]

struct Student: Codable{
  let id: String
  let studentName: String
  let studentScolarship: String
  let studentAge: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case studentName = "employee_name"
    case studentScolarship = "employee_salary"
    case studentAge = "employee_age"
  }
}
