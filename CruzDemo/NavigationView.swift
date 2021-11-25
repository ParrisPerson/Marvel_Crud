//
//  NavigationView.swift
//   
//
//   
//

import UIKit

class NavigationView: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //Required to maintain the support with iOS 12.4 (minimum version supported)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImage(color: UIColor.white, size: CGSize(width: navigationBar.frame.width, height: 1))
        navigationBar.setBackgroundImage(background, for: UIBarMetrics.default)
        navigationBar.shadowImage = background
        
        let backButton = UIImage(named: "backIcon")
        navigationBar.tintColor = .black
        navigationBar.backIndicatorImage = backButton
        navigationBar.backIndicatorTransitionMaskImage = backButton
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        if let baseViewController = rootViewController as? BaseView, baseViewController.hasMenuButton {
           
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        if let baseViewController = viewControllers.first as? BaseView {
            
        }
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    @objc func popCurrentViewController(_ animated: Bool)
    {
        self.popViewController(animated: true)
    }
}
