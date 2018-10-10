//
//  CalendarViewCell.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 10/9/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                dateLabel!.textColor = UIColor.green
                dateLabel.font = UIFont.boldSystemFont(ofSize: 12)
            } else {
                dateLabel!.textColor = UIColor.darkText
                dateLabel.font = UIFont.systemFont(ofSize: 12)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
