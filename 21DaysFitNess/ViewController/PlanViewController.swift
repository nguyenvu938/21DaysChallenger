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
    @IBOutlet weak var clockInLabel: UILabel!
    @IBOutlet weak var myTrainingLabel: UILabel!
    
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "PlanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlanCollectionViewCell")
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var weekDay = [weekModel]()
    var labelName: String = ""
    var subImageName: String = ""
    var titleImageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        setupLayout()
        setupWeekDay()
        
        titleImageView.image = UIImage(named: titleImageName)
        label.text = labelName
        subImageView.image = UIImage(named: subImageName)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
        view.addSubview(collectionView)
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
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        collectionView.topAnchor.constraint(equalTo: clockInLabel.bottomAnchor, constant: 6).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: myTrainingLabel.topAnchor, constant: -40).isActive = true
        
    }
    
    func setupWeekDay() {
        let sun = weekModel(dayLabel: "SUN", checkImage: "circlegray")
        let mon = weekModel(dayLabel: "MON", checkImage: "circlegray")
        let tue = weekModel(dayLabel: "TUE", checkImage: "circlegray")
        let wed = weekModel(dayLabel: "WED", checkImage: "circlegray")
        let thu = weekModel(dayLabel: "THU", checkImage: "circlegray")
        let fri = weekModel(dayLabel: "FRI", checkImage: "circlegray")
        let sat = weekModel(dayLabel: "SAT", checkImage: "circlegray")
        
        weekDay = [sun, mon, tue, wed, thu, fri, sat]
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
        challengerVC.titleImageName = titleImageName
        challengerVC.subImageName = subImageName
        challengerVC.labelName = labelName
        challengerVC.modalPresentationStyle = .fullScreen
        self.present(challengerVC, animated: true, completion: nil)
    }
}

extension PlanViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanCollectionViewCell", for: indexPath) as! PlanCollectionViewCell
        cell.dayLabel.text = weekDay[indexPath.row].dayLabel
        cell.checkImageView.image = UIImage(named: weekDay[indexPath.row].checkImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width)/9
        return CGSize(width: size, height: 50)
    }
}
