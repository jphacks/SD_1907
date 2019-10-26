//
//  RetuernTripCandidatesTableViewCell.swift
//  jphacks
//
//  Created by 寺尾京芽 on 2019/10/26.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class RetuernTripCandidatesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var departTimeLabel: UILabel!
    @IBOutlet weak var arriveTimeLabel: UILabel!
    
    @IBOutlet weak var airportALabel: UILabel!
    @IBOutlet weak var airportBLabel: UILabel!
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
}
