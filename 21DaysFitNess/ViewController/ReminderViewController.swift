//
//  ReminderViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 03/02/2021.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backImageView: UIImageView!
    
    let setReminderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set a reminder", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(goSetReminder), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()

        subView.layer.cornerRadius = 24
        subView.layer.borderWidth = 2
        subView.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        subView.addSubview(setReminderButton)
        
        setReminderButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 693).isActive = true
        setReminderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        setReminderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        setReminderButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func goBack() {
        let menuVC = MenuViewController()
        let navigation = UINavigationController(rootViewController: menuVC)
        self.present(navigation, animated: true, completion: nil)
    }
    
    @objc func goSetReminder() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let timerVC = storyboard.instantiateViewController(identifier: "TimerViewController") as! TimerViewController
        timerVC.modalPresentationStyle = .fullScreen
        self.present(timerVC, animated: true, completion: nil)
    }
}
