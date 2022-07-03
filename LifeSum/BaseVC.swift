//
//  BaseVC.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import UIKit

public class BaseVC: UIViewController {
    
   
    
    public func runOnMainThread(_ block: @escaping () -> Void) {
        DispatchQueue.main.async {
            block()
        }
    }
    
   
    public func cancelBtnClickHandlerWithRetry(_ errorMsg: String, _ title: String, action : @escaping ()->Void) {
        
        let alert = UIAlertController(title: title, message: errorMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Quit app", style: UIAlertAction.Style.destructive, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            exit(EXIT_SUCCESS)
        }))
        present(alert, animated: true, completion: nil)
    
    }
    
 

    public override func viewDidLoad() {
        super.viewDidLoad()
        
       

        
    }
    


}
