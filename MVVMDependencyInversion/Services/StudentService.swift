//
//  StudentService.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import Foundation
import UIKit

final class StudentService: StudentServiceProtocol {
  
  func getImages() -> [UIImage]  {
    let imagesArray = [UIImage(named: "dosmorras")!,
                       UIImage(named: "fan")!,
                       UIImage(named: "kiim")!,
                       UIImage(named: "lol")!,
                       UIImage(named: "mike")!,
                       UIImage(named: "morra")!,
                       UIImage(named: "morralado")!,
                       UIImage(named: "tom")!,
                       UIImage(named: "tyler")!,
                       UIImage(named: "unamorralado")!,
                       UIImage(named: "unvatoo")!,
                       UIImage(named: "vato")!,
                       UIImage(named: "dosmorras")!,
                       UIImage(named: "fan")!,
                       UIImage(named: "kiim")!,
                       UIImage(named: "lol")!,
                       UIImage(named: "mike")!,
                       UIImage(named: "morra")!,
                       UIImage(named: "morralado")!,
                       UIImage(named: "tom")!,
                       UIImage(named: "tyler")!,
                       UIImage(named: "unamorralado")!,
                       UIImage(named: "unvatoo")!,
                       UIImage(named: "vato")!,
                       UIImage(named: "dosmorras")!,
                       UIImage(named: "fan")!,
                       UIImage(named: "kiim")!,
                       UIImage(named: "lol")!,
                       UIImage(named: "mike")!,
                       UIImage(named: "morra")!,
                       UIImage(named: "morralado")!,
                       UIImage(named: "tom")!,
                       UIImage(named: "tyler")!,
                       UIImage(named: "unamorralado")!,
                       UIImage(named: "unvatoo")!,
                       UIImage(named: "vato")!]
    
    return imagesArray
  }
  
  
  public static let shared = StudentService()
  
  let studentsURL = "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json"
  let params: [String: String] = ["": ""]
  
  public init () {}
  
  func getStudents(completion: @escaping (Result<Students?, ServiceError>) -> Void) {
    APICaller.shared.GET(url: studentsURL, params: params, httpHeader: HTTPHeaderFields.application_json) { success, data in
      
      if success {
        do {
          guard let data = data else { return completion(.failure(.NoDataAvailable)) }
          
          let students = try JSONDecoder().decode(Students.self, from: data)
          completion(.success(students))
          return
          
        } catch {
          completion(.failure(.DecodingError))
        }
        return
      }
      
      completion(.failure(.NetworkFailure))
      
    }
  }
  
}
