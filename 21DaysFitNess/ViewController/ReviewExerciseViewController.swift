//
//  ReviewExerciseViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 04/03/2021.
//

import UIKit
import SwiftGifOrigin

class ReviewExerciseViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var exDetailLabel: UILabel!
    
    var exText: String = ""
    var exImageName: String = ""
    var exNameText: String = ""
    var exDetailText: String = ""
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        return button
    }()
    
    let nextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ">"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.80, green: 0.20, blue: 0.34, alpha: 1.00)
        return label
    }()
    
    let preLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "<"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.80, green: 0.20, blue: 0.34, alpha: 1.00)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        exImageView.layer.cornerRadius = 5
        
        subView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        subView.layer.cornerRadius = 24
        subView.layer.borderWidth = 2
        subView.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        
        exerciseLabel.text = String(exText)
        exImageView.image = UIImage.gif(name: String(exImageName))
        exNameLabel.text = String(exNameText)
        exDetailLabel.text = String(exDetailText)
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        containerView.addSubview(startButton)
        containerView.addSubview(nextLabel)
        containerView.addSubview(preLabel)
        
        startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60).isActive = true
        startButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        nextLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor, constant: 0).isActive = true
        nextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38).isActive = true
        
        preLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor, constant: 0).isActive = true
        preLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38).isActive = true
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
