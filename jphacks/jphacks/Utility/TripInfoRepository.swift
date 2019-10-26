//
//  TripInfoRepository.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/27.
//  Copyright © 2019 山下陽央. All rights reserved.
//

struct TripInfoRepository {
    func findInfo() -> TripInfo? {
        return TripInfoCache.shared.info
    }
    
    func save(_ info: TripInfo) {
        TripInfoCache.shared.info = info
    }
}

class TripInfoCache {
    static let shared = TripInfoCache()
    private init() {}
    var info: TripInfo?
}

struct TripInfo: Codable {
    private let imageUrl: String?
    private let connectedProviders: [String]
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "profile_image"
        case connectedProviders = "connected_providers"
    }
}
