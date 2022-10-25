//
//  StudentServiceProtocol .swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import Foundation
import UIKit

protocol StudentServiceProtocol {
  func getStudents(completion: @escaping (Result<Students?, ServiceError>) -> Void)
  func getImages() -> [UIImage]
}
