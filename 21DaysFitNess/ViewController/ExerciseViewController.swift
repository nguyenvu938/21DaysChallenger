//
//  ExerciseViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 24/02/2021.
//

import UIKit
import SwiftGifOrigin

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "ExcerciseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExcerciseCollectionViewCell")
        collectionView.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start now", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.89, green: 0.94, blue: 0.98, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(goStart), for: .touchUpInside)
        return button
    }()
    
    var d: String = ""
    var arrId = [DayDataModel]()
    var listPlanReturn = [planModel]()
    var listCanShow = [planModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        dayLabel.text = d
        
        APIService.shared.plan_default() {dataRepond, _ in
            if let dataRepond = dataRepond {
                self.listPlanReturn = dataRepond
                for item in self.listPlanReturn {
                    for item2 in self.arrId {
                        if item.id == item2.actionId{
                            self.listCanShow.append(item)
                            break
                        }
                    }
                }
                self.collectionView.reloadData()
            }
        }
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
    }
    
    func setupLayout() {
        containerView.addSubview(startButton)
        containerView.addSubview(collectionView)
        
        startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22).isActive = true
        startButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 29).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -29).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
    }
    
    @objc func goStart() {
        
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ExerciseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listCanShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExcerciseCollectionViewCell", for: indexPath) as! ExcerciseCollectionViewCell
        cell.excerciseLabel.text = self.listCanShow[indexPath.row].task_name
        if cell.excerciseLabel.text == "PLANK"
        {
            cell.timeLabel.text = String(self.arrId[indexPath.row].time) + "s"
        } else {
            cell.timeLabel.text =  "x" + String(self.arrId[indexPath.row].time)
        }
        cell.imageView.image = UIImage.gif(name: String(self.listCanShow[indexPath.row].pic_path))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 327 , height: 114)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let reviewExerciseVC = storyboard.instantiateViewController(identifier: "ReviewExerciseViewController") as! ReviewExerciseViewController
        reviewExerciseVC.exText = self.listCanShow[indexPath.row].task_name
        reviewExerciseVC.exImageName = self.listCanShow[indexPath.row].pic_path
        reviewExerciseVC.exNameText = self.listCanShow[indexPath.row].task_name
        reviewExerciseVC.exDetailText = self.listCanShow[indexPath.row].tts_text
        reviewExerciseVC.totalPage = self.listCanShow.count
        reviewExerciseVC.index = indexPath.row
        reviewExerciseVC.modalPresentationStyle = .fullScreen
        self.present(reviewExerciseVC, animated: true, completion: nil)
    }
}
