//
//  ViewController.swift
//  Alert
//
//  Created by indrajit on 15/08/18.
//  Copyright © 2018 Indrajit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        AlertView.show(title: "Alert", message: "Are you sure ?", preferredStyle: .alert, buttons: ["Yes","No"]) { (button) in
            print(button)
        }
    }
 
}

class AlertView{
    
    static func show(title:String? = nil,message:String?,preferredStyle: UIAlertControllerStyle = .alert,buttons:[String] = ["Ok"],completionHandler:@escaping (String)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for button in buttons{
           
            var style = UIAlertActionStyle.default
            let buttonText = button.lowercased().replacingOccurrences(of: " ", with: "")
            if buttonText == "cancel"{
                style = .cancel
            }
            let action = UIAlertAction(title: button, style: style) { (_) in
                completionHandler(button)
            }
            alert.addAction(action)
        }
        
        DispatchQueue.main.async {
            if let app = UIApplication.shared.delegate as? AppDelegate, let rootViewController = app.window?.rootViewController {
                rootViewController.present(alert, animated: true, completion: nil)
            }
          
        }
    }
}












