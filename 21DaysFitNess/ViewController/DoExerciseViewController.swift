//
//  DoExerciseViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 08/03/2021.
//

import UIKit
import SwiftGifOrigin

class DoExerciseViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var runImageView: UIImageView!
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var exTimeLabel: UILabel!
    @IBOutlet weak var subImageView: UIImageView!
    @IBOutlet weak var planImageView: UIImageView!
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "play")
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
    
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 10
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        
        planImageView.layer.cornerRadius = 20
        dayLabel.text = d
        exImageView.image = UIImage.gif(name: doExImageView)
        exNameLabel.text = doExNameLabel
        exTimeLabel.text = doExTimeLabel
        
        let tapRun = UITapGestureRecognizer(target: self, action: #selector(goRun))
        playImageView.addGestureRecognizer(tapRun)
        playImageView.isUserInteractionEnabled = true
        runImageView.addGestureRecognizer(tapRun)
        runImageView.isUserInteractionEnabled = true
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
        let tapSkip = UITapGestureRecognizer(target: self, action: #selector(goSkip))
        skipLabel.addGestureRecognizer(tapSkip)
        skipLabel.isUserInteractionEnabled = true
        
//        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
        // here you define the fromValue, toValue and duration of your animation
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = timeLeft
        // add the animation to your timeLeftShapeLayer
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        // define the future end time by adding the timeLeft to now Date()
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
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
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goSkip() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doExercise2VC = storyboard.instantiateViewController(identifier: "DoExercise2ViewController") as! DoExercise2ViewController
        doExercise2VC.dataDayLabel = d
        doExercise2VC.dataExImageView = doExImageView
        doExercise2VC.dataExLabel = doExNameLabel
        doExercise2VC.dataNextImageView = dataNextImageView
        doExercise2VC.dataNextExLabel = dataNextExLabel
        doExercise2VC.dataTimeLabel = doExTimeLabel
        doExercise2VC.dataNextImageView = dataNextTimeLabel
        doExercise2VC.modalPresentationStyle = .fullScreen
        self.present(doExercise2VC, animated: true, completion: nil)
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
    
//    func drawBgShape() {
//        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: subImageView.frame.midY-4), radius:
//            40, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
//        bgShapeLayer.strokeColor = UIColor.white.cgColor
//        bgShapeLayer.fillColor = UIColor.clear.cgColor
//        bgShapeLayer.lineWidth = 3
//        view.layer.addSublayer(bgShapeLayer)
//    }
    
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: subImageView.frame.midY-4), radius:
            40, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.red.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 3
        view.layer.addSublayer(timeLeftShapeLayer)
    }
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-40 ,y: subImageView.frame.midY-29, width: 80, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeLeft.time
        view.addSubview(timeLabel)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft.time
        } else {
            timeLabel.text = "0s"
            timer.invalidate()
        }
    }
}

extension TimeInterval {
    var time: String {
        return String(format:"%d%ds", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
