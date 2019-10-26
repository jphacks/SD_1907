//
//  TripInfoApi.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

//import Foundation
//import Alamofire

//enum TripInfoApi {
//    var baseURL: String {
//        return Constant.getAPISeverUrl()
//    }
//    
//    // param1: token
//    // param2: userId
//    case post(String, Int)
//}
//
//extension TripInfoApi {
//    internal var path: String {
//        switch self {
//        case .post:
//            return "users/me/version"
//        }
//    }
//    
//    internal var headers: [String: String]? {
//        switch self {
//        case let .post(token, _):
//            return ["Authorization": token, "Accept": "application/json"]
//        }
//    }
//    
//    internal var method: Alamofire.HTTPMethod {
//        switch self {
//        case .post:
//            return .post
//        }
//    }
//    
//    internal var parameters: [String: AnyObject]? {
//        switch self {
//        case let .post(_, userId):
//            return [
//                "ios_app_version": VersionManager.shared.current as AnyObject,
//                "id": userId as AnyObject,
//                "language": (LanguageCodePredictor.infer() ?? "") as AnyObject
//            ]
//        }
//    }
//    
//    internal var alamofireParams: (url: String, method: Alamofire.HTTPMethod, headers: [String: String]?, params: [String: Any]?) {
//        let url = baseURL + path
//        return (url: url, method: method, headers: headers, params: parameters)
//    }
//}
