//
//  AlertManager.swift
//  BookFest
//
//  Created by Senthil on 10/09/23.
//

import UIKit

class AlertManager{
    
    //MARK: Shared Instance
    class var SharedInstance: AlertManager {
        struct Global {
            static let instance = AlertManager()
        }
        return Global.instance
    }
    
    //MARK: Internet Alert
    func internetAlert() {

        showAlert(alertTitle: "Internet Connection Required", alertMessage: "Please Check Your Internet Connection", alertButtonTitle: "OK")
    }
    
    //MARK: Internet Alert with Image
    func internetAlertwithImage() {
        
        alertWithoutHandler(alertTitle: "Internet Connection Required", alertMessage: "Please Check Your Internet Connection", alertImage: "wifi", alertButtonTitle: "OK")
    }
    
    
    //MARK: Alert Controller with Normal
    func showAlert(alertTitle title: String! , alertMessage message: String! , alertButtonTitle cancelButtonTitle: String!) {
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: cancelButtonTitle, style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: Alert Controller Without Handler
    func alertWithoutHandler (alertTitle title: String! , alertMessage message: String!, alertImage AImage: String! , alertButtonTitle cancelButtonTitle: String!)  {
        
        let errorTitle : String
        if AImage != nil {
            errorTitle = "\n\n \(title!)"
        }else{
            errorTitle = "\(title!)"
        }
        let alert = UIAlertController(title: errorTitle, message:message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:cancelButtonTitle, style: UIAlertAction.Style.default, handler: nil))
        
        // Image Not a nil
        if AImage != nil{
            // Adding Image to AlertController
            let imageView = UIImageView(frame: CGRect.init(x: 110, y: 10, width: 50, height: 50))
            imageView.image = UIImage(named: AImage)
            alert.view.addSubview(imageView)
        }
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK: Alert Controller With Image and Handler
    func alertWithHandler (alertTitle title: String!, alertMessage message: String!, alertImage AImage: String!, buttonTitle buttonNames: [String?], buttonHandler Handler: ((UIAlertAction?) -> Void)!) {
        
        let errorTitle : String
        if AImage != nil {
            errorTitle = "\n\n \(title!)"
        }else{
            errorTitle = "\(title!)"
        }
        
        let alert = UIAlertController(title: errorTitle, message:message, preferredStyle: UIAlertController.Style.alert)
        for name in buttonNames {
            alert.addAction(UIAlertAction(title: name, style: .default, handler: Handler))
        }
        
        // Image Not a nil
        if AImage != nil{
            // Adding Image to AlertController
            let imageView = UIImageView(frame: CGRect.init(x: 110, y: 10, width: 50, height: 50))
            imageView.image = UIImage(named: AImage)
            alert.view.addSubview(imageView)
        }
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
