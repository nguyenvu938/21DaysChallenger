//
//  ProgramViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 25/01/2021.
//

import UIKit
import SwiftyShadow

class ProgramViewController: UIViewController {
    var plans = [Program]()
    var indexSelected = -1

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: "ProgramCollectionViewCell")
        collectionView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    let ellipseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Ellipse")
        return image
    }()
    
    let titleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pic1")
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose your 21 days training program"
        label.numberOfLines = 2
        label.textColor = UIColor(red: 0.20, green: 0.27, blue: 0.41, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let planButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose this plan", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.91, green: 0.95, blue: 0.98, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        addSubview()
        setupLayout()
        setupProgam()
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addSubview() {
        view.addSubview(collectionView)
        view.addSubview(ellipseImageView)
        view.addSubview(titleImageView)
        view.addSubview(titleLabel)
        view.addSubview(planButton)
    }
    
    func setupLayout() {
        ellipseImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -72).isActive = true
        ellipseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -60).isActive = true
        ellipseImageView.widthAnchor.constraint(equalToConstant: 494).isActive = true
        ellipseImageView.heightAnchor.constraint(equalToConstant: 218).isActive = true
        
        titleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41).isActive = true
        titleImageView.widthAnchor.constraint(equalToConstant: 295).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor, constant: 74).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor, constant: 7).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        planButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        planButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        planButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        planButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 21).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: planButton.topAnchor, constant: -36).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }
    
    func setupProgam() {
        let plan1 = Program(titleImageName: "pic2", label: "FAT BURNING EXERCISE", subImageName: "rec2")
        let plan2 = Program(titleImageName: "pic3", label: "WAIST EXERCISE", subImageName: "rec3")
        let plan3 = Program(titleImageName: "pic4", label: "LEG FAT BURNING EXERCISE", subImageName: "rec4")
        let plan4 = Program(titleImageName: "pic5", label: "HIP EXERCISE", subImageName: "rec5")
        
        plans = [plan1, plan2, plan3, plan4]
    }
    
    @objc func onClick() {
        let planVC = PlanViewController()
        let navigation = UINavigationController(rootViewController: planVC)
        if indexSelected == 0 {
            planVC.titleImageView.image = UIImage(named: "pic2")
            planVC.label.text = "FAT BURNING EXERCISE"
            planVC.subImageView.image = UIImage(named: "rec2")
        } else if indexSelected == 1 {
            planVC.titleImageView.image = UIImage(named: "pic3")
            planVC.label.text = "WAIST EXERCISE"
            planVC.subImageView.image = UIImage(named: "rec3")
        } else if indexSelected == 2 {
            planVC.titleImageView.image = UIImage(named: "pic4")
            planVC.label.text = "LEG FAT BURNING EXERCISE"
            planVC.subImageView.image = UIImage(named: "rec4")
        } else if indexSelected == 3 {
            planVC.titleImageView.image = UIImage(named: "pic5")
            planVC.label.text = "HIP EXERCISE"
            planVC.subImageView.image = UIImage(named: "rec5")
        }
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}

extension ProgramViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgramCollectionViewCell", for: indexPath) as! ProgramCollectionViewCell
        cell.plan = plans[indexPath.row]
        if self.indexSelected == indexPath.row {
            cell.checkedImageView.image = UIImage(named: "check")
        } else {
            cell.checkedImageView.image = UIImage()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 327, height: 129)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexSelected = indexPath.row
        if indexSelected != -1 {
            planButton.setTitleColor(UIColor(red: 0.20, green: 0.27, blue: 0.41, alpha: 1.00), for: .normal)
        }
        self.collectionView.reloadData()
    }
}
