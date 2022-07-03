//
//  BaseRequestWorker.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import Foundation
import Alamofire

public class BaseRequestWorker {
    
    public func makeRequest(Url: String, foodid: Int, headers: [String: String], closure: @escaping (Int, Data?) -> Void) {
        
       // debugPrint(postUrl, foodid)
        let request = AF.request(Url, method: .get, encoding: JSONEncoding.default, headers: .default)
        request.responseString { (response) in
           // debugPrint(response)
            
            if let data = response.data {
                let responseBody = String(data: data, encoding: .utf8)
                debugPrint(responseBody as Any)
                
            }
            
            if let error = response.error {
                debugPrint(error)
                closure(-1, nil)
                return
            }
            
            guard let resp = response.response else {
                closure(-1, nil)
                return
            }
            
            if resp.statusCode == 200 {
                if let data = response.data {
                    closure(resp.statusCode, data)
                } else {
                    closure(-1, nil)
                }
            } else {
                closure(resp.statusCode, nil)
            }
        }
    }
    
}
