////
////  ExerciseViewController.swift
////  21DaysFitNess
////
////  Created by Nguyen Vu on 24/02/2021.
////
//
//import UIKit
//
//class ExerciseViewController: UIViewController {
//    
//    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var backImageView: UIImageView!
//    @IBOutlet weak var dayLabel: UILabel!
//    
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(UINib(nibName: "ExcerciseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExcerciseCollectionViewCell")
//        collectionView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
//        collectionView.showsVerticalScrollIndicator = false
//        return collectionView
//    }()
//    
//    let startButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Start now", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
//        button.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
//        button.layer.cornerRadius = 20
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
//        button.addTarget(self, action: #selector(goStart), for: .touchUpInside)
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupLayout()
//        
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
//    
//    func setupLayout() {
//        containerView.addSubview(startButton)
//        containerView.addSubview(collectionView)
//        
//        startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22).isActive = true
//        startButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
//        startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
//        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        
//        collectionView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 29).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -29).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
//    }
//    
//    @objc func goStart() {
//        
//    }
//}
//
//extension ExerciseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}