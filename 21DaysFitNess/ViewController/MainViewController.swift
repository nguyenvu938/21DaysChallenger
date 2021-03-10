//
//  MainView.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 11/01/2021.
//

import UIKit

class MainViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let closeImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "close")
//        return image
//    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Rectangle 1")
        return image
    }()
    
    let subView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        return view
    }()
    
    let agreeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setTitle("Agree", for: .normal)
        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.91, green: 0.95, blue: 0.98, alpha: 1.00)
        button.layer.shadowColor = UIColor(red: 0.69, green: 0.76, blue: 0.82, alpha: 1.00).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0
        button.addTarget(self, action: #selector(onAgreeButton), for: .touchUpInside)
        return button
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21 Days"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor(red: 0.20, green: 0.27, blue: 0.41, alpha: 1.00)
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21 days to be better ourselves"
        label.textColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
        label.font = UIFont(name: "Lato", size: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubview()
        setupLayout()
    }
    
    func addSubview() {
        view.addSubview(containerView)
        containerView.addSubview(imageView)
//        containerView.addSubview(closeImage)
        containerView.addSubview(subView)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
        containerView.addSubview(agreeButton)
    }
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 626).isActive = true
        
        subView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        subView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        subView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        subView.heightAnchor.constraint(equalToConstant: 266).isActive = true
        
        label1.topAnchor.constraint(equalTo: subView.topAnchor, constant: 35).isActive = true
        label1.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 14).isActive = true
        label2.centerXAnchor.constraint(equalTo: containerView.centerXAnchor,constant: 0).isActive = true
        
        agreeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 702).isActive = true
        agreeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        agreeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        agreeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func onAgreeButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let programVC = storyboard.instantiateViewController(identifier: "ProgramViewController") as! ProgramViewController
        programVC.modalPresentationStyle = .fullScreen
        self.present(programVC, animated: true, completion: nil)
    }
}
