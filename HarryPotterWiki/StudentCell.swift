//
//  WizardCell.swift
//  HarryPotterWiki
//
//  Created by Pei-Tzu Huang on 2024/9/18.
//

import UIKit

class StudentCell: UITableViewCell {
    
    var studentImageView = UIImageView()
    var studentNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(studentImageView)
        addSubview(studentNameLabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(student: Student) {
        studentNameLabel.text = student.name
        
        if let imageURL = student.image, let url = URL(string: imageURL) {
            fetchImage(from: url)
        }
        
            
    }
    private func fetchImage(from url: URL) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.studentImageView.image = image
                }
            }
            
        }
        .resume()
    }

    func configureImageView() {
        studentImageView.contentMode = .scaleAspectFit
        studentImageView.layer.cornerRadius = 10
        studentImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        studentNameLabel.numberOfLines = 0
        studentNameLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageConstraints() {
        studentImageView.translatesAutoresizingMaskIntoConstraints = false
        studentImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        studentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        studentImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        studentImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setLabelConstraints() {
        studentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        studentNameLabel.leadingAnchor.constraint(equalTo: studentImageView.trailingAnchor, constant: 20).isActive = true
        studentNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        studentNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
