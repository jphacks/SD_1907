//
//  PlanCandidatesTableViewCell.swift
//  jphacks
//
//  Created by 寺尾京芽 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class PlanCandidatesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var departTimeLabel: UILabel!
    @IBOutlet weak var arriveTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}
