//
//  PlanViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 26/01/2021.
//

import UIKit

class PlanViewController: UIViewController {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var planImageView: UIImageView!
    
    let titleImageView: UIImageView = {
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
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21 days left"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
        return label
    }()
    
    let progessBarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "progess bar")
        return image
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        setupLayout()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        
        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(openMenu))
        menuImageView.addGestureRecognizer(tapMenu)
        menuImageView.isUserInteractionEnabled = true
        
        let tapSetting = UITapGestureRecognizer(target: self, action: #selector(openSetting))
        settingImageView.addGestureRecognizer(tapSetting)
        settingImageView.isUserInteractionEnabled = true
        
        let tapChallenger = UITapGestureRecognizer(target: self, action: #selector(goChallenger))
        planImageView.addGestureRecognizer(tapChallenger)
        planImageView.isUserInteractionEnabled = true
    }
    
    func addSubview() {
        planImageView.addSubview(titleImageView)
        planImageView.addSubview(subImageView)
        planImageView.addSubview(label)
        planImageView.addSubview(subLabel)
        planImageView.addSubview(progessBarImageView)
    }
    
    
    func setupLayout() {
        
        titleImageView.centerYAnchor.constraint(equalTo: planImageView.centerYAnchor, constant: -5).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: planImageView.trailingAnchor, constant: -25).isActive = true
        
        label.topAnchor.constraint(equalTo: planImageView.topAnchor, constant: 43).isActive = true
        label.leadingAnchor.constraint(equalTo: planImageView.leadingAnchor, constant: 37).isActive = true
        label.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        subImageView.topAnchor.constraint(equalTo: planImageView.topAnchor, constant: 93).isActive = true
        subImageView.leadingAnchor.constraint(equalTo: planImageView.leadingAnchor, constant: 37).isActive = true
        
        subLabel.bottomAnchor.constraint(equalTo: planImageView.bottomAnchor, constant: -42).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: planImageView.leadingAnchor, constant: 37).isActive = true
        
        progessBarImageView.centerXAnchor.constraint(equalTo: planImageView.centerXAnchor, constant: 0).isActive = true
        progessBarImageView.bottomAnchor.constraint(equalTo: planImageView.bottomAnchor, constant: -22).isActive = true
    }
    
    @objc func openMenu() {
        let menuVC = MenuViewController()
        let navigation = UINavigationController(rootViewController: menuVC)
        self.present(navigation, animated: true, completion: nil)
    }
    
    @objc func openSetting() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = storyboard.instantiateViewController(identifier: "SettingViewController") as! SettingViewController
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
    }
    
    @objc func goChallenger() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let challengerVC = storyboard.instantiateViewController(identifier: "ChallengerViewController") as! ChallengerViewController
        challengerVC.titleImageView.image = titleImageView.image
        challengerVC.subImageView.image = subImageView.image
        challengerVC.label.text = label.text
        challengerVC.modalPresentationStyle = .fullScreen
        self.present(challengerVC, animated: true, completion: nil)
    }
}

extension PlanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
