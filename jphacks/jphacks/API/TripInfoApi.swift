//
//  TripInfoApi.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import Foundation
import Alamofire

enum Constant {
    static let url = ""
}


enum TripInfoApi {
    var baseURL: String {
        return Constant.url
    }
    case get(info: String)
}

extension TripInfoApi {
    var path: String {
        switch self {
        case let .get(urlString):
            let url = "video_download?url=" + urlString
            return url
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .get:
            return nil
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .get:
            return nil
        }
    }
    
    var alamofireParams: (url: String, method: Alamofire.HTTPMethod, headers: [String: String]?, params: [String: Any]?) {
        let url = baseURL + path
        return (url: url, method: method, headers: headers, params: parameters)
    }
}
