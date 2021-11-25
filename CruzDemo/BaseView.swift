//
//  BaseView.swift
//   
//
//   
//

import UIKit
import Loaf

protocol BaseViewDelegate: AnyObject {
    func keyboardWillAppear(_ notification: NSNotification)
    func keyboardWillHide(_ notification: NSNotification)
}

class BaseView: UIViewController {
    weak var delegate: BaseViewDelegate?
     
    var hasMenuButton: Bool = false
    
    @objc enum Navigation: Int {
        case initialLogin, biometric
    }
    
    var rootNavController: NavigationView? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
           let window = appDelegate.getWindow(),
           let root = window.rootViewController as? NavigationView {
             return root
        }
        return nil
    }
    
    convenience init(title: String?, hasMenuButton: Bool = false) {
        self.init()
        self.title = title
        self.hasMenuButton = hasMenuButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.hideKeyboardWhenTappedAround()
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 20)!]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.backButtonTitle = String.empty

         
    }
    
    @objc fileprivate func keyboardShow(_ notification: NSNotification) {
        if let delegate = self.delegate {
            delegate.keyboardWillAppear(notification)
        }
    }
    
    @objc fileprivate func keyboardHide(_ notification: NSNotification) {
        if let delegate = self.delegate {
            delegate.keyboardWillHide(notification)
        }
    }
    
    func hideTitle() {
        self.navigationItem.titleView?.isHidden = true
        self.title = nil
    }
    
    func showTitle() {
        self.navigationItem.titleView?.isHidden = false
    }
    
    @objc fileprivate func pushAddIcon() {
       
    }
    
    var addBadgeButton: BadgeBarButtonItem?

    
    func setAddcon() {
         
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "Add"), style: .plain, target: self, action: #selector(pushAddIcon))
        
    }
 
    func setupConstraints() {}
}

 
