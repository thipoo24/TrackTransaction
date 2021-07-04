//
//  Webservice.swift
//  TrackTransaction
//
//  Created by Poornima on 03/07/21.
//

import Foundation
import Alamofire

let header = ["Content-Type": "application/json", "entityType": "admin", "countryCode": "KW", "company": "414173", "branch": "414999", "channel": "mobile"]

func webService(url:String,parameter:Parameters,completion:@escaping (Data?,Error?) -> Void) {
    Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
       // print(response.result.value)
        switch response.result{
        case .success(var trData):
            trData = response.data!
            completion(trData as? Data,nil)
        case .failure(var error):
            error = response.result.error!
          completion(nil,error)
        default:
            break;
        }
    }
}

