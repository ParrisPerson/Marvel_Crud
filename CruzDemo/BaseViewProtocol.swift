//
//  BaseViewProtocol.swift
//   
//
//   
//

import Foundation
import UIKit
import SVProgressHUD
import Loaf

protocol BaseViewProtocol: BaseView {
    
    func showProgress()
    func hideProgress()
    
    func reloadViews()
    
    func showSuccessToast(message: String, completion: (() -> ())?)
    func showErrorToast(message: String, completion: (() -> ())?)
}

extension BaseViewProtocol {

    func showProgress() {
        SVProgressHUD.show()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    func hideProgress() {
        SVProgressHUD.dismiss()
        if UIApplication.shared.isIgnoringInteractionEvents == true {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func reloadViews(){}
    
    func showErrorToast(message: String, completion: (() -> ())? = nil) {
        Loaf.dismiss(sender: self)
        if completion != nil {
            Loaf(message, state: .custom(.init(backgroundColor: .toastBackColor, textColor: .errorColor, font: UIFont(name: "OpenSans-Bold", size: 14)!, icon: UIImage(named: "toastIcon"), width: .screenPercentage(0.9))), location: .top, sender: self).show(.short) { _ in
                completion!()
            }
        }
        else {
            Loaf(message, state: .custom(.init(backgroundColor: .toastBackColor, textColor: .errorColor, font: UIFont(name: "OpenSans-Bold", size: 14)!, icon: UIImage(named: "toastIcon"), width: .screenPercentage(0.9))), location: .top, sender: self).show(.short)
        }
        
    }
    
    func showSuccessToast(message: String, completion: (() -> ())? = nil) {
        Loaf.dismiss(sender: self)
        if completion != nil {
            Loaf(message, state: .custom(.init(backgroundColor: .toastSuccessColor, textColor: .white, font: UIFont(name: "SulSans-Bold", size: 14)!, icon: UIImage(named: "toastSuccessIcon"))), location: .top, sender: self).show(.short){ _ in
                completion!()
            }
        }
        else {
            Loaf(message, state: .custom(.init(backgroundColor: .toastSuccessColor, textColor: .white, font: UIFont(name: "SulSans-Bold", size: 14)!, icon: UIImage(named: "toastSuccessIcon"))), location: .top, sender: self).show(.short)
        }
    }
}
