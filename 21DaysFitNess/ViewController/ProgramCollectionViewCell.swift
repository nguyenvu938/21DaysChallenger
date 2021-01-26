//
//  ProgramCollectionViewCell.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 26/01/2021.
//

import UIKit

class ProgramCollectionViewCell: UICollectionViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        return view
    }()
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let checkedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let subImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.20, green: 0.27, blue: 0.41, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    func setupLayout() {
        addSubview(containerView)
        containerView.addSubview(titleImageView)
        containerView.addSubview(subImageView)
        containerView.addSubview(label)
        containerView.addSubview(checkedImageView)

        checkedImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
        checkedImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        checkedImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        checkedImageView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        titleImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        titleImageView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18).isActive = true
        label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23).isActive = true
        label.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        subImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23).isActive = true
        subImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 65).isActive = true
    }
    
    var plan: Program? {
        didSet {
            if let plan = plan {
                titleImageView.image = UIImage(named: plan.titleImageName)
                subImageView.image = UIImage(named: plan.subImageName)
                label.text = plan.label
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
