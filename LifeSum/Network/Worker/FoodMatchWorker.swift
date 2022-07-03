//
//  FoodMatchWorker.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import Foundation

public class FoodMatchWorker: BaseRequestWorker {
    func matchFoods(foodid: Int, closure: @escaping (Int, FoodResponse?) -> Void) {
        do {
            let headers = [
                "content-type": "application/json",
                "cache-control": "no-cache"
            ]
            
            let Url = "https://api.lifesum.com/v2/foodipedia/codetest?foodid=\(foodid)"
            makeRequest(Url: Url, foodid: foodid, headers: headers, closure: { (statusCode, stringData) in
                if statusCode == 200 {
                    do {
                        if let data = stringData {
                            let jSonDecoder = JSONDecoder()
                            jSonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                            let foodResponse = try jSonDecoder.decode(FoodResponse.self, from: data)
                           
                            closure(statusCode, foodResponse)
                        } else {
                            closure(statusCode, nil)
                        }
                    } catch {
                        debugPrint(error)
                        closure(statusCode, nil)
                    }
                } else {
                    closure(statusCode, nil)
                }
            })
        }
    }
}
