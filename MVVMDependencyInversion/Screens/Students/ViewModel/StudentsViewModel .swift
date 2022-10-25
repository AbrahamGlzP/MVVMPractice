//
//  StudentsViewModel .swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import Foundation
import UIKit

class StudentsViewModel: NSObject {
  
  private var studentService: StudentServiceProtocol
  
  var reloadTableView: (() -> Void)?
  
  var students = Students()
  
  var studentsImages = [UIImage]()
  
  var studentCellViewModels = [StudentCellViewModel]() {
    didSet {
      reloadTableView?()
    }
  }
  
  init(studentServiceProtocol: StudentServiceProtocol){
    self.studentService = studentServiceProtocol
  }
  
  func getStudents() {
    
    studentService.getStudents { [weak self] result in
      
      switch result{
      case .success(let students):
        guard let students = students else { return }
        self?.getStudentProfilePics()
        self?.fetchData(students: students)
        
      case.failure(let error):
        print(error)
      }
    }
    
  }
  
  func getStudentProfilePics() {
    
    studentsImages = studentService.getImages()
  }
  
  func fetchData(students: Students) {
    self.students = students //cache
    
    var studentCells = [StudentCellViewModel]()
    for index in 0..<students.count {
      let student = students[index]
      studentCells.append(StudentCellViewModel(image: studentsImages[index], id: student.id, name: student.studentName, scolarship: student.studentScolarship, age: student.studentAge))
    }
    
    studentCellViewModels = studentCells
  
    /*let studentsCellViewModelArray = students.compactMap({ StudentCellViewModel(image: ,
                                                                                id: $0.id,
                                                                                name: $0.studentName,
                                                                                scolarship: "$ \($0.studentScolarship)",
                                                                                age: $0.studentAge)})*/
    
    
  }
  
  func getStudentCellViewModel(at indexPath: IndexPath) -> StudentCellViewModel {
    return studentCellViewModels[indexPath.row]
  }
  
}
