//
//  TripInfoRepository.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/27.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TripInfoRepository {
    func findInfo() -> [TripInfo] {
        return TripInfoCache.shared.info
    }
    
    func save(_ info: [TripInfo]) {
        TripInfoCache.shared.info = info
    }
}

class TripInfoCache {
    static let shared = TripInfoCache()
    private init() {}
    var info: [TripInfo] = []
    
    
}

class TripInfo {
    let title: String
    let attributedTitle: NSMutableAttributedString
    let url: String
    let imageUrl: URL?
    let description: String
    let mediaName: String
    
    init(json: JSON) {
        title = json["title"].stringValue
        attributedTitle = NSMutableAttributedString(string: title)
        url = json["link"].stringValue
        imageUrl = json["img_url"].url
        description = json["description"].stringValue
        mediaName = json["media_name"].stringValue
    }
}

extension TripInfo {
    static func parse(json: JSON) -> [TripInfo] {
        let jsons = json.arrayValue
        return jsons.map({ TripInfo(json: $0) })
    }
}
