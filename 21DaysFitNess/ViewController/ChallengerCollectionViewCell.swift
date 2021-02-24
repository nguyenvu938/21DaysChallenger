//
//  ChallengerCollectionViewCell.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 04/02/2021.
//

import UIKit

class ChallengerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayView.layer.cornerRadius = 15
        dayLabel.numberOfLines = 0
    }

}
