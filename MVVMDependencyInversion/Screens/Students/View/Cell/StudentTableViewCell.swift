//
//  StudentTableViewCell.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 21/10/22.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
  
  static var identifier: String { return String(describing: self) }
  
  var studentImageView = UIImageView()
  var studentNameLabel = UILabel()
  
  var cellViewModel: StudentCellViewModel? {
    didSet {
      studentImageView.image = cellViewModel?.image
      studentNameLabel.text = cellViewModel?.name
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(studentImageView)
    addSubview(studentNameLabel)
    
    configureImageView()
    configureStudentName()
    setStudentImageConstraints()
    setStudentNameLabelConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureImageView() {
    studentImageView.layer.cornerRadius = 10
    studentImageView.clipsToBounds = true
  }
  
  private func configureStudentName() {
    studentNameLabel.numberOfLines = 0
    studentNameLabel.adjustsFontSizeToFitWidth = true
  }
  
  func setStudentImageConstraints() {
    studentImageView.translatesAutoresizingMaskIntoConstraints = false
    studentImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    studentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    studentImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    studentImageView.widthAnchor.constraint(equalTo: studentImageView.heightAnchor, multiplier: 16/9).isActive = true
  }
   
  func setStudentNameLabelConstraints() {
    studentNameLabel.translatesAutoresizingMaskIntoConstraints = false
    studentNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    studentNameLabel.leadingAnchor.constraint(equalTo: studentImageView.trailingAnchor, constant: 20).isActive = true
    studentNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    studentNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
  }
}
