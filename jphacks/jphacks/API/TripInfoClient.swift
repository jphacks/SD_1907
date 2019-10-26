//
//  TripInfoClient.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

//import Foundation
//
//import Alamofire
//import SwiftyJSON
//
//final class TripInfoClient {
//    static func post(token: String) {
//        guard let userId = AccountManager.getSmoozOrAnonymousUserID() else { return }
//        let api = VersionApi.post(token, userId)
//        let (url, method, headers, params) = api.alamofireParams
//        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
//            .validate(statusCode: 200..<300)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let responseData):
//                    Log.debug(responseData)
//                    
//                    if let data = response.data {
//                        do {
//                            let info = try JSONDecoder().decode(ProfileImageInfo.self, from: data)
//                            ProfileImageCache.shared.imageUrl = info.imageUrl
//                            ProfileImageCache.shared.connectedProvider = info.connectedProvider.first as? String
//                        } catch {
//                            Log.fatal(error: error)
//                        }
//                    }
//                                        
//                case .failure(let error):
//                    Log.fatal(error: error)
//                }
//        }
//    }
//}
