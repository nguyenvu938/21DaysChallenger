//
//  SettingViewController.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 27/01/2021.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        backImageView.addGestureRecognizer(tapBack)
        backImageView.isUserInteractionEnabled = true
        
        subView.layer.cornerRadius = 49
    }
    
    @objc func goBack() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let planVC = storyboard.instantiateViewController(identifier: "PlanViewController") as! PlanViewController
        planVC.modalPresentationStyle = .fullScreen
        self.present(planVC, animated: true, completion: nil)
    }
}
