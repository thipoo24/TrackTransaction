//
//  ExtensionFile.swift
//  TrackTransaction
//
//  Created by Poornima on 03/07/21.
//

import Foundation
import  UIKit

extension UIButton {
    func setBtnShadow(){
    self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    self.layer.shadowRadius = 8
    self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
    
}

extension UIViewController{
    func showVCAlert(title:String? = nil,message:String? = nil){
        let netAlertController = UIAlertController(title: title ?? "No Internet Connection", message: message ?? "Please check your Internet Connectivity...", preferredStyle: UIAlertController.Style.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            netAlertController.dismiss(animated: true, completion: nil)
        }
         netAlertController.addAction(okAction)
         self.present(netAlertController, animated: true, completion: nil)
    }
    
    @objc func setIndicator(indicatorColor:UIColor? = nil){
       indicator.color = indicatorColor ?? UIColor.white
       indicator.frame = CGRect(x: 0.0, y: 0.0, width: 75.0, height: 75.0)
       indicator.center = self.view.center
       self.view.addSubview(indicator)
       indicator.bringSubviewToFront(self.view)
   }
    
    @objc func setModalPresent(){
        if #available(iOS 13.0, *) {
           self.isModalInPresentation = true
        }
        else {
           self.modalPresentationStyle = .fullScreen
        }
    }
   
    
    
}

extension UIView {
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = true;
    }
    func setBorderColor(borderColor:UIColor? = UIColor.clear,width:CGFloat? = nil, radius:CGFloat? = nil) {
    self.layer.borderColor = borderColor?.cgColor
    self.layer.cornerRadius = radius ?? 0.0
    self.layer.borderWidth = width ?? 2.0
}
}
