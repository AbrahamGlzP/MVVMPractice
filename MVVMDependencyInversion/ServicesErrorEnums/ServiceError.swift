//
//  ServiceError.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import Foundation

enum ServiceError: Error{
  case DecodingError
  case BadRequest
  case NetworkFailure
  case NoDataAvailable
}
