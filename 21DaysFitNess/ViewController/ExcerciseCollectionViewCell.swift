//
//  ExcerciseCollectionViewCell.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 24/02/2021.
//

import UIKit

class ExcerciseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var excerciseLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 24
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        imageView.layer.cornerRadius = 5
    }

}
