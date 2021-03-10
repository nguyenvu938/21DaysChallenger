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
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var exDetailTextView: UITextView!
  
    var totalPage: Int = 0
    var index: Int = 0
    var listCanShow = [planModel]()
    
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
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        exImageView.layer.cornerRadius = 10
        
        subView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        exDetailTextView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        exDetailTextView.showsVerticalScrollIndicator = false
        subView.layer.cornerRadius = 24
        subView.layer.borderWidth = 2
        subView.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
       
        exerciseLabel.text = listCanShow[index].task_name
        exImageView.image = UIImage.gif(name: listCanShow[index].pic_path)
        exNameLabel.text = listCanShow[index].task_name
        exDetailTextView.text = listCanShow[index].tts_text
        totalLabel.text = String(index + 1) + "/" + String(totalPage)
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
        let tapNext = UITapGestureRecognizer(target: self, action: #selector(goNext))
        nextLabel.addGestureRecognizer(tapNext)
        nextLabel.isUserInteractionEnabled = true
        let tapPre = UITapGestureRecognizer(target: self, action: #selector(goPre))
        preLabel.addGestureRecognizer(tapPre)
        preLabel.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        containerView.addSubview(startButton)
        containerView.addSubview(nextLabel)
        containerView.addSubview(preLabel)
        containerView.addSubview(totalLabel)
        
        startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60).isActive = true
        startButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        nextLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor, constant: 0).isActive = true
        nextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38).isActive = true
        
        preLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor, constant: 0).isActive = true
        preLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38).isActive = true
        
        totalLabel.centerXAnchor.constraint(equalTo: startButton.centerXAnchor, constant: 0).isActive = true
        totalLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor, constant: 0).isActive = true
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goNext() {
        if index < totalPage {
            index = index + 1
        } else {
            index = totalPage
        }
        totalLabel.text = String(index + 1) + "/" + String(totalPage)
        if listCanShow.count > index {
            exerciseLabel.text = listCanShow[index].task_name
            exImageView.image = UIImage.gif(name: listCanShow[index].pic_path)
            exNameLabel.text = listCanShow[index].task_name
            exDetailTextView.text = listCanShow[index].tts_text
        }
    }
    
    @objc func goPre() {
        if index > 0 {
            index = index - 1
        } else {
            index = 1
        }
        totalLabel.text = String(index + 1) + "/" + String(totalPage)
        if listCanShow.count > index {
            exerciseLabel.text = listCanShow[index].task_name
            exImageView.image = UIImage.gif(name: listCanShow[index].pic_path)
            exNameLabel.text = listCanShow[index].task_name
            exDetailTextView.text = listCanShow[index].tts_text
        }
    }

}
