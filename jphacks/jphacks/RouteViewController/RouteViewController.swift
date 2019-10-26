//
//  routeViewController.swift
//  jphacks
//
//  Created by 寺尾京芽 on 2019/10/26.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var airportALabel: UILabel!
    
    @IBOutlet weak var airportB: UILabel!
    
    @IBOutlet weak var timeALabel: UILabel!
    
    @IBOutlet weak var timeBLabel: UILabel!
    
    @IBOutlet weak var flightNoLabel: UILabel!
    
    @IBOutlet weak var hotelImageView: UIImageView!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    @IBOutlet weak var returnDateLabel: UILabel!
    
    
    @IBOutlet weak var returnTripInfoStackView: UIStackView!
    
    
    
    @IBAction func didTapOpenMapButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapDetailButton(_ sender: Any) {
        
    }
}
