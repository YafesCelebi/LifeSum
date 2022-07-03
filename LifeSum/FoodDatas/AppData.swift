//
//  AppData.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import Foundation

class AppData {
    
    static var sharedInstance = AppData()
    private init() {
    }

    public var title: String = ""
    public var calories: Int = 0
    public var carbs: Float = 0.0
    public var protein: Float = 0.0
    public var fat: Float = 0.0
    public var saturatedfat: Float = 0.0
    public var unsaturatedfat: Float = 0.0
    public var fiber: Float = 0.0
    public var cholesterol: Float = 0.0
    public var sugar: Float = 0.0
    public var sodium: Float = 0.0
    public var potassium: Float = 0.0
    public var gramsperserving: Float = 0.0
    public var pcstext: String = ""
    
    public var carbsRatio: String = ""
    public var proteinRatio: String = ""
    public var fatRatio: String = ""
}
