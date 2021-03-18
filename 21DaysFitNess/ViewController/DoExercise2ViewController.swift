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
    @IBOutlet weak var progressView: UIProgressView!
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pause")
        return imageView
    }()
    
    var dataDayLabel: String = ""
    var dataExImageView: String = ""
    var dataExLabel: String = ""
    var dataTimeLabel: String = ""
    var dataNextImageView: String = ""
    var dataNextExLabel: String = ""
    var dataNextTimeLabel: String = ""
    var isRed = false
    var progressBarTimer: Timer!
    var isRunning = false
    var rep: Int = 0
    var isRun: Bool = true
    var timer = Timer()
    var progress = Progress()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        startTimer()
        
        planImageView.layer.cornerRadius = 20
        dayLabel.text = dataDayLabel
        exImageView.image = UIImage.gif(name: dataExImageView)
        exLabel.text = dataExLabel
        timeLabel.text = dataTimeLabel
        nextImageView.image = UIImage.gif(name: dataNextImageView)
        nextExLabel.text = dataNextExLabel
        nextTimeLabel.text = dataNextTimeLabel
        
        
        progressView.layer.cornerRadius = 13
        progressView.progress = 0.0
        progress.totalUnitCount = Int64(rep)
        progress.completedUnitCount = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
        }
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
        let tapRun = UITapGestureRecognizer(target: self, action: #selector(goRun))
        runImageView.addGestureRecognizer(tapRun)
        runImageView.isUserInteractionEnabled = true
    }
    
    func setupLayout() {
        runImageView.addSubview(playImageView)
        
        playImageView.centerXAnchor.constraint(equalTo: runImageView.centerXAnchor, constant: 0).isActive = true
        playImageView.centerYAnchor.constraint(equalTo: runImageView.centerYAnchor, constant: -2).isActive = true
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if rep != 0 {
            rep -= 1
            if dataExLabel == "PLANK" {
                timeLabel.text = String(rep) + "s"
            } else {
                timeLabel.text = "x" + String(rep)
            }
        } else {
            timer.invalidate()
            let aler = UIAlertController(title: "Completed", message: "Do you want to go next round?", preferredStyle: UIAlertController.Style.alert)
            aler.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let doExerciseVC = storyboard.instantiateViewController(identifier: "DoExerciseViewController") as! DoExerciseViewController
                doExerciseVC.modalPresentationStyle = .fullScreen
                self.present(doExerciseVC, animated: true, completion: nil)
            }))
            aler.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(aler, animated: true, completion: nil)
        }
    }
    
    @objc func goRun() {
        changeFunction(isRun)
        if isRun == true {
            timer.fireDate = Date.distantFuture
        } else {
            timer.fireDate = Date()
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
}
