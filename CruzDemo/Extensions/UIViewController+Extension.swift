//
//  UIViewController+Extension.swift
//  Lendu
//
//   
//

import UIKit.UIViewController

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        self.navigationController?.view.endEditing(true)
        view.endEditing(true)
    }
}
