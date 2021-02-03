//
//  MenuViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 27/01/2021.
//

import UIKit

class MenuViewController: UIViewController {
    var menuArr = [Menu]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        return tableView
    }()
    
    let menubarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "menubar")
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Menu"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let skipImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Skip")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        setupLayout()
        setupMenu()
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let closeMenu = UITapGestureRecognizer(target: self, action: #selector(goBack))
        skipImageView.addGestureRecognizer(closeMenu)
        skipImageView.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        view.addSubview(menubarImageView)
        view.addSubview(label)
        view.addSubview(skipImageView)
        
        menubarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        menubarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 33).isActive = true
        
        tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 46).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        skipImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -12).isActive = true
        skipImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func setupMenu() {
        let menu1 = Menu(label: "Select plan", icon: "05")
        let menu2 = Menu(label: "Reminder", icon: "favorite")
        let menu3 = Menu(label: "Recording", icon: "02")
        let menu4 = Menu(label: "Feed back", icon: "gesture")
        let menu5 = Menu(label: "Privacy policy", icon: "forum")
        
        menuArr = [menu1, menu2, menu3, menu4, menu5]
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.iconImageView.image = UIImage(named: menuArr[indexPath.row].icon)
        cell.menuLabel.text = menuArr[indexPath.row].label
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}
