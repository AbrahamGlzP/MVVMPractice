//
//  StudentInfoView.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 24/10/22.
//

import UIKit

struct StudentInfoViewModel {
  let description: String
  let value: String
}

class StudentInfoView: UIView {
  
  let stackView = UIStackView()
  let stackViewSpacing = CGFloat(5)
  
  let describingLabel = UILabel()
  let valueLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureStackView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureStackView() {
    addSubview(stackView)
    stackView.axis = .horizontal
    stackView.spacing = stackViewSpacing
    stackView.distribution = .fillEqually
    
    setStackViewConstraints()
    setupLabels()
  }
  
  func configureLabels(with viewModel: StudentInfoViewModel) {
    describingLabel.text = viewModel.description
    valueLabel.text = viewModel.value
  }
  
  private func setStackViewConstraints() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  private func setupLabels(){
    stackView.addArrangedSubview(describingLabel)
    describingLabel.textAlignment = .center
    describingLabel.translatesAutoresizingMaskIntoConstraints = false
    describingLabel.widthAnchor.constraint(equalToConstant: frame.width / 2 - stackViewSpacing).isActive = true
    describingLabel.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
    
    stackView.addArrangedSubview(valueLabel)
    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    valueLabel.widthAnchor.constraint(equalToConstant: frame.width / 2 - stackViewSpacing).isActive = true
    valueLabel.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
  }
}
