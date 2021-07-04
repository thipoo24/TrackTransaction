//
//  TransactionHome.swift
//  TrackTransaction
//
//  Created by Poornima on 03/07/21.
//

import Foundation
import Alamofire

class TransactionHomeVM {
    var transactDetails : TransactionData?
    var trUrl = GlobalConstants.baseUrl
    
    func getTrasactionsDetails(taxRefNo:String,completion:@escaping(Bool) -> ()) {
        let param : Parameters = ["agentcode":414999, "txnrefno":taxRefNo]
        print(param,trUrl)
        let decoder = JSONDecoder()
        webService(url: trUrl, parameter: param) { (jsonData, error) in
            do {
            let transactResponse = try! decoder.decode(TransactionRoot.self, from:jsonData!)
                if transactResponse.status == "success" {
                    self.transactDetails = transactResponse.data
                    completion(true)
                }
                else {
                    completion(false)
                }
                
            }catch{
                print(error)
            }
        
    }
}
}
/*{
 "timestamp": 1625322831350,
 "status": 415,
 "error": "Unsupported Media Type",
 "message": "",
 "path": "/jarvis/v1/payments/enquiry"
}*/
