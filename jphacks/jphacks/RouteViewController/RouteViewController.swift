//
//  routeViewController.swift
//  jphacks
//
//  Created by 寺尾京芽 on 2019/10/26.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {
//    let info: TripInfo
    
    init(indexPath: IndexPath) {
//        self.info = TripInfoRepository().findInfo()[indexPath.row]

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        airportALabel.text = InitialInfo.shared.airportName
//        airportBLabel.text = info.AirPortName
//        timeALabel.text = info.ForwardAirDepartTime
//        timeBLabel.text = info.ForwardAirArriveTime
//        
//        
//        flightNoLabel.text = info.ForwardAirTicketPrice
//        
//        
//        hotelImageView.image = hotelmage
//        rateLabel.text = info.hotelReviewRate
//        reviewCountLabel.text = info.hotelReviewNum
//        
//        returnDateLabel.text = InitialInfo.shared.returnDate
//        
    }
    
//    private var hotelmage: UIImage? {
//        if let imageUrl = info.hotelImage {
//            do {
//                let data = try Data(contentsOf: imageUrl)
//                return UIImage(data: data)
//            } catch {
//                fatalError()
//            }
//        } else {
//            return nil
//        }
//    }
    
    @IBOutlet weak var airportALabel: UILabel!
    @IBOutlet weak var airportBLabel: UILabel!
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
