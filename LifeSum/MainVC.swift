//
//  MainVC.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import UIKit
import JGProgressHUD

class MainVC: BaseVC {
    
    
    private var foodID = 1
    
    //create foodChart subview from FoodChart
    private var foodChart: FoodChart = {
        let view = FoodChart()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
    return view }()
    
    private func getFoodInformations(foodId: Int) {
        let hud = JGProgressHUD()
        runOnMainThread {
            hud.textLabel.text = "Please wait..."
            hud.show(in: self.view)
        }
        
        let dataModel = FoodMatchWorker()
        dataModel.matchFoods(foodid: foodId, closure: {(statusCode, response)   in
            
            DispatchQueue.main.async {
                hud.dismiss()
            }
          
            guard let responseModel = response else {
                self.runOnMainThread {
                debugPrint("responseModel:", response as Any)
                    super.cancelBtnClickHandlerWithRetry("Something went wrong.\nFoodId: \(self.foodID)", "Error") {
                        
                    }
                }
                return
            }
            
            if statusCode == 200 {
                self.runOnMainThread {
                    AppData.sharedInstance.title = responseModel.response.title
                    AppData.sharedInstance.calories = responseModel.response.calories
                    AppData.sharedInstance.carbs = responseModel.response.carbs
                    AppData.sharedInstance.protein = responseModel.response.protein
                    AppData.sharedInstance.fat = responseModel.response.fat
                    self.view.addSubview(self.foodChart)
                }
                    
            }
        })
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        foodChart.frame = view.frame
        self.getFoodInformations(foodId: self.foodID)
    }
    
   
    
   

}

