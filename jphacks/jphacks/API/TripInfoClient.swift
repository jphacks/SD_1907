//
//  TripInfoClient.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class TripInfoClient {
    static func get(info: String, completionHandler: @escaping (String) -> Void, errorHandler: @escaping () -> Void) {
        let api: TripInfoApi = .get(info: info)
        let (url, method, headers, params) = api.alamofireParams
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let responseData):
                    
                    if let data = response.data {
                        do {
                            let info = try JSONDecoder().decode(TripInfo.self, from: data)
                            TripInfoRepository().save(info)
                        } catch {
                            fatalError()
                        }
                    }
                                        
                case .failure(let error):
                    errorHandler()
                }
        }
    }
}
