//
//  StudentDetailViewController.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 23/10/22.
//

import UIKit

enum StudentInfo: String {
  case id = "ID: "
  case name = "Name: "
  case scolarship = "Scolarship: "
  case age = "Age: "
}

class StudentDetailViewController: UIViewController {
  
  var studentViewModel: StudentCellViewModel? {
    didSet {
      
    }
  }
  
  let detailStackView = UIStackView()
  
  let userImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
      configureUI()
    }
  
  private func configureUI(){
    view.backgroundColor = .systemBackground
    title = "Detail"
    navigationController?.navigationBar.prefersLargeTitles = true
    configureStackView()
    setupImage()
  }
  
  private func configureStackView() {
    view.addSubview(detailStackView)
    detailStackView.distribution = .fillEqually
    detailStackView.spacing = 5
    detailStackView.axis = .vertical
    
    setStackViewConstraints()
    addItemsToStackView()
  }
  
  func setupImage() {
    view.addSubview(userImage)
    userImage.translatesAutoresizingMaskIntoConstraints = false
    
    userImage.bottomAnchor.constraint(equalTo: detailStackView.topAnchor, constant: -20).isActive = true
    userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    userImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor, multiplier: 4/3).isActive = true
    
    userImage.image = studentViewModel?.image
  }
  
  private func setStackViewConstraints() {
    detailStackView.translatesAutoresizingMaskIntoConstraints = false
    detailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    detailStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    detailStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    detailStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
  }
    
  private func addItemsToStackView() {
    
    let idView = StudentInfoView()
    idView.configureLabels(with: StudentInfoViewModel(description: StudentInfo.id.rawValue, value: studentViewModel?.id ?? ""))
    idView.translatesAutoresizingMaskIntoConstraints = false
    idView.widthAnchor.constraint(equalToConstant: detailStackView.frame.width).isActive = true
    idView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    let nameView = StudentInfoView()
    nameView.configureLabels(with: StudentInfoViewModel(description: StudentInfo.name.rawValue, value: studentViewModel?.name ?? ""))
    nameView.translatesAutoresizingMaskIntoConstraints = false
    nameView.widthAnchor.constraint(equalToConstant: detailStackView.frame.width).isActive = true
    nameView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    let scolarshipView = StudentInfoView()
    scolarshipView.configureLabels(with: StudentInfoViewModel(description: StudentInfo.scolarship.rawValue, value: studentViewModel?.scolarship ?? ""))
    scolarshipView.translatesAutoresizingMaskIntoConstraints = false
    scolarshipView.widthAnchor.constraint(equalToConstant: detailStackView.frame.width).isActive = true
    scolarshipView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    let ageView = StudentInfoView()
    ageView.configureLabels(with: StudentInfoViewModel(description: StudentInfo.age.rawValue, value: studentViewModel?.age ?? ""))
    ageView.translatesAutoresizingMaskIntoConstraints = false
    ageView.widthAnchor.constraint(equalToConstant: detailStackView.frame.width).isActive = true
    ageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    detailStackView.addArrangedSubview(idView)
    detailStackView.addArrangedSubview(nameView)
    detailStackView.addArrangedSubview(scolarshipView)
    detailStackView.addArrangedSubview(ageView)
  }
  

}
