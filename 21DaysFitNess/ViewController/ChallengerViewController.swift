//
//  ChallengerViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 04/02/2021.
//

import UIKit

class ChallengerViewController: UIViewController {
    
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "21 Days"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
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
    
    let subView: UIView = {
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
        label.font = UIFont(name: "Lato", size: 12)
        label.textColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
        return label
    }()
    var listExersire : [exerciseModel] = [exerciseModel]()
    let progessBarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "progess bar")
        return image
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(goStart), for: .touchUpInside)
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let nib1 = UINib(nibName: "ChallengerCollectionViewCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "ChallengerCollectionViewCell")
        collectionView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupDay()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(openMenu))
        menuImageView.addGestureRecognizer(tapMenu)
        menuImageView.isUserInteractionEnabled = true
        
        let tapSetting = UITapGestureRecognizer(target: self, action: #selector(openSetting))
        settingImageView.addGestureRecognizer(tapSetting)
        settingImageView.isUserInteractionEnabled = true
       
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        containerView.addSubview(ellipseImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(menuImageView)
        containerView.addSubview(settingImageView)
        containerView.addSubview(subView)
        subView.addSubview(titleImageView)
        subView.addSubview(subImageView)
        subView.addSubview(label)
        subView.addSubview(subLabel)
        subView.addSubview(progessBarImageView)
        containerView.addSubview(startButton)
        containerView.addSubview(collectionView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        ellipseImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -72).isActive = true
        ellipseImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -60).isActive = true
        ellipseImageView.widthAnchor.constraint(equalToConstant: 494).isActive = true
        ellipseImageView.heightAnchor.constraint(equalToConstant: 218).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 56).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        
        menuImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4).isActive = true
        
        settingImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        settingImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 288).isActive = true
        
        subView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 103).isActive = true
        subView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        subView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        subView.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        titleImageView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 22).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -16).isActive = true
        
        label.topAnchor.constraint(equalTo: subView.topAnchor, constant: 18).isActive = true
        label.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 23).isActive = true
        label.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        subImageView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 61).isActive = true
        subImageView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 23).isActive = true
        
        subLabel.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -22).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 23).isActive = true
        
        progessBarImageView.centerXAnchor.constraint(equalTo: subView.centerXAnchor, constant: 0).isActive = true
        progessBarImageView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -3).isActive = true
        
        startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22).isActive = true
        startButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 29).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -29).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
    }
    
    func setupDay() {
        APIService.shared.plan_FAT_BURNING_EXERCISE(){dataRepond,_ in
            if let dataRepond = dataRepond{
                self.listExersire = dataRepond
            }
        }
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
    
    @objc func goStart() {
        
    }
}

extension ChallengerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listExersire.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengerCollectionViewCell", for: indexPath) as! ChallengerCollectionViewCell
        cell.dayLabel.text = String(self.listExersire[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth - 10 , height: 106)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let excerciseVC = storyboard.instantiateViewController(identifier: "ExerciseViewController") as! ExerciseViewController
//        excerciseVC.dayLabel.text = days[indexPath.row].label
//        excerciseVC.modalPresentationStyle = .fullScreen
//        self.present(excerciseVC, animated: true, completion: nil)
//    }
}
