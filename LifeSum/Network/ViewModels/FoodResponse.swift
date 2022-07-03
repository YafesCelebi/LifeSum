//
//  FoodResponse.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import Foundation

public struct FoodResponse: Decodable {
    public let response: FoodDetails
}

public struct FoodDetails: Decodable {
    public let title: String
    public let calories: Int
    public let carbs: Float
    public let protein: Float
    public let fat: Float
    public let saturatedfat: Float
    public let unsaturatedfat: Float
    public let fiber: Float
    public let cholesterol: Float
    public let sugar: Float
    public let sodium: Float
    public let gramsperserving: Float
    public let potassium: Float
    public let pcstext: String
}
