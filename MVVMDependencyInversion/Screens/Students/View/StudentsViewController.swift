//
//  StudentsViewController.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 21/10/22.
//

import UIKit

class StudentsViewController: UIViewController {
  
  let studentsTableView = UITableView()
  
  lazy var studentViewModel = {
    StudentsViewModel(studentServiceProtocol: StudentService.shared)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Students"
    initTableView()
    initViewModel()
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initViewModel() {
    studentViewModel.getStudents()
    
    studentViewModel.reloadTableView = { [weak self] in
      DispatchQueue.main.async {
        self?.studentsTableView.reloadData()
      }
    }
  }
  
  private func initTableView() {
    view.addSubview(studentsTableView)
    studentsTableView.pin(to: view)
    studentsTableView.register(StudentTableViewCell.self, forCellReuseIdentifier: StudentTableViewCell.identifier)
    studentsTableView.delegate = self
    studentsTableView.dataSource = self
    studentsTableView.rowHeight = 100
  }
  
}

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return studentViewModel.studentCellViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let studentCell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier, for: indexPath) as! StudentTableViewCell
    
    studentCell.cellViewModel = studentViewModel.getStudentCellViewModel(at: indexPath)
    
    return studentCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let detailViewController = StudentDetailViewController()
    detailViewController.studentViewModel = studentViewModel.getStudentCellViewModel(at: indexPath)
    navigationController?.pushViewController(detailViewController, animated: true)
  }
  
  
}
