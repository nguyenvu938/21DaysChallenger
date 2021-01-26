//
//  PlanViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 26/01/2021.
//

import UIKit

class PlanViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        return view
    }()
    
    let ellipseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Ellipse")
        return image
    }()
    
    let menuImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "menu")
        return image
    }()
    
    let settingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "setting")
        return image
    }()
    
    let kcalImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "kcalbar")
        return image
    }()
    
    let dayImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "daybar")
        return image
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21 Days"
        label.textColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clock in"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0/7 ▶"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My training"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recommended training"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        addSubview()
        setupLayout()
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
    }
    
    func addSubview() {
        view.addSubview(containerView)
        containerView.addSubview(ellipseImageView)
        containerView.addSubview(menuImageView)
        containerView.addSubview(settingImageView)
        containerView.addSubview(kcalImageView)
        containerView.addSubview(dayImageView)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
        containerView.addSubview(label3)
        containerView.addSubview(label4)
        containerView.addSubview(label5)
        containerView.addSubview(imageView)
    }
    
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        ellipseImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -72).isActive = true
        ellipseImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -60).isActive = true
        ellipseImageView.widthAnchor.constraint(equalToConstant: 494).isActive = true
        ellipseImageView.heightAnchor.constraint(equalToConstant: 218).isActive = true
        
        menuImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4).isActive = true
        
        settingImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        settingImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 288).isActive = true
        
        label1.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        label1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 56).isActive = true
        
        kcalImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        kcalImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 78).isActive = true
        
        dayImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        dayImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 206).isActive = true
        
        label2.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 183).isActive = true
        label2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25).isActive = true
        
        label3.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 184).isActive = true
        label3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -23).isActive = true
        
        label4.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 284).isActive = true
        label4.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25).isActive = true
        
        label5.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 315).isActive = true
        label5.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25).isActive = true
        
        
    }
}
