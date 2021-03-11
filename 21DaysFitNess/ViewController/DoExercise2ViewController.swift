//
//  DoExercise2ViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 11/03/2021.
//

import UIKit
import SwiftGifOrigin

class DoExercise2ViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var exLabel: UILabel!
    @IBOutlet weak var runImageView: UIImageView!
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var nextExLabel: UILabel!
    @IBOutlet weak var nextTimeLabel: UILabel!
    @IBOutlet weak var planImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "play")
        return imageView
    }()
    
    var isRun: Bool = true
    var dataDayLabel: String = ""
    var dataExImageView: String = ""
    var dataExLabel: String = ""
    var dataTimeLabel: String = ""
    var dataNextImageView: String = ""
    var dataNextExLabel: String = ""
    var dataNextTimeLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        planImageView.layer.cornerRadius = 20
        dayLabel.text = dataDayLabel
        exImageView.image = UIImage.gif(name: dataExImageView)
        exLabel.text = dataExLabel
        timeLabel.text = dataTimeLabel
        nextImageView.image = UIImage.gif(name: dataNextImageView)
        nextExLabel.text = dataNextExLabel
        nextTimeLabel.text = dataNextTimeLabel
        
        let tapRun = UITapGestureRecognizer(target: self, action: #selector(goRun))
        playImageView.addGestureRecognizer(tapRun)
        playImageView.isUserInteractionEnabled = true
        runImageView.addGestureRecognizer(tapRun)
        runImageView.isUserInteractionEnabled = true
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        runImageView.addSubview(playImageView)
        
        playImageView.centerXAnchor.constraint(equalTo: runImageView.centerXAnchor, constant: 0).isActive = true
        playImageView.centerYAnchor.constraint(equalTo: runImageView.centerYAnchor, constant: -2).isActive = true
    }
    
    @objc func goRun() {
        changeFunction(isRun)
        isRun = !isRun
    }
    
    func changeFunction(_ value: Bool){
        if value {
            playImageView.image = UIImage(named: "play")
            playImageView.image = UIImage(named: "pause")
        } else {
            playImageView.image = UIImage(named: "pause")
            playImageView.image = UIImage(named: "play")
        }
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
