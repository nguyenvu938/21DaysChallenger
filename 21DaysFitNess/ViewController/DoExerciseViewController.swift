//
//  DoExerciseViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 08/03/2021.
//

import UIKit
import SwiftGifOrigin
import SRCountdownTimer

class DoExerciseViewController: UIViewController, SRCountdownTimerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var runImageView: UIImageView!
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var exTimeLabel: UILabel!
    @IBOutlet weak var subImageView: UIImageView!
    @IBOutlet weak var planImageView: UIImageView!
    @IBOutlet weak var countdownTimer: SRCountdownTimer!
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pause")
        return imageView
    }()
    
    var isRun: Bool = true
    var d: String = ""
    var doExTimeLabel: String = ""
    var doExImageView: String = ""
    var doExNameLabel: String = ""
    var index: Int = 0
    var dataNextImageView: String = ""
    var dataNextExLabel: String = ""
    var dataNextTimeLabel: String = ""
    var rep: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        planImageView.layer.cornerRadius = 20
        dayLabel.text = d
        exImageView.image = UIImage.gif(name: doExImageView)
        exNameLabel.text = doExNameLabel
        exTimeLabel.text = doExTimeLabel
        
        countdownTimer.backgroundColor = .clear
        countdownTimer.labelFont = UIFont.systemFont(ofSize: 24)
        countdownTimer.labelTextColor = UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00)
//        countdownTimer.timerFinishingText = "0"
        countdownTimer.lineWidth = 3
        countdownTimer.lineColor = UIColor(red: 1.00, green: 0.25, blue: 0.42, alpha: 1.00)
        countdownTimer.trailLineColor = .clear
        countdownTimer.start(beginingValue: 15, interval: 1)
        countdownTimer.delegate = self
        
        let tapRun = UITapGestureRecognizer(target: self, action: #selector(goRun))
        runImageView.addGestureRecognizer(tapRun)
        runImageView.isUserInteractionEnabled = true
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
        let tapSkip = UITapGestureRecognizer(target: self, action: #selector(goSkip))
        skipLabel.addGestureRecognizer(tapSkip)
        skipLabel.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        runImageView.addSubview(playImageView)
        
        playImageView.centerXAnchor.constraint(equalTo: runImageView.centerXAnchor, constant: 0).isActive = true
        playImageView.centerYAnchor.constraint(equalTo: runImageView.centerYAnchor, constant: -2).isActive = true
    }
    
    @objc func goRun() {
        changeFunction(isRun)
        if isRun == true {
            countdownTimer.pause()
        } else {
            countdownTimer.resume()
        }
        isRun = !isRun
    }
    
    func changeFunction(_ value: Bool){
        if value {
            playImageView.image = UIImage(named: "pause")
            playImageView.image = UIImage(named: "play")
        } else {
            playImageView.image = UIImage(named: "play")
            playImageView.image = UIImage(named: "pause")
        }
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goSkip() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doExercise2VC = storyboard.instantiateViewController(identifier: "DoExercise2ViewController") as! DoExercise2ViewController
        doExercise2VC.dataDayLabel = d
        doExercise2VC.rep = rep
        doExercise2VC.dataExImageView = doExImageView
        doExercise2VC.dataExLabel = doExNameLabel
        doExercise2VC.dataNextImageView = dataNextImageView
        doExercise2VC.dataNextExLabel = dataNextExLabel
        doExercise2VC.dataTimeLabel = doExTimeLabel
        doExercise2VC.dataNextTimeLabel = dataNextTimeLabel
        doExercise2VC.modalPresentationStyle = .fullScreen
        self.present(doExercise2VC, animated: true, completion: nil)
    }
    
    func timerDidEnd(sender: SRCountdownTimer, elapsedTime: TimeInterval){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doExercise2VC = storyboard.instantiateViewController(identifier: "DoExercise2ViewController") as! DoExercise2ViewController
        doExercise2VC.dataDayLabel = d
        doExercise2VC.rep = rep
        doExercise2VC.dataExImageView = doExImageView
        doExercise2VC.dataExLabel = doExNameLabel
        doExercise2VC.dataNextImageView = dataNextImageView
        doExercise2VC.dataNextExLabel = dataNextExLabel
        doExercise2VC.dataTimeLabel = doExTimeLabel
        doExercise2VC.dataNextTimeLabel = dataNextTimeLabel
        doExercise2VC.modalPresentationStyle = .fullScreen
        self.present(doExercise2VC, animated: true, completion: nil)
    }
}
