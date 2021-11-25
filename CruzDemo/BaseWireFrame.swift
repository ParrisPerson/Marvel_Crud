//
//  BaseWireFrame.swift
//   
//
//   
//

import UIKit
import SafariServices

protocol BaseWireFrameProtocol: AnyObject {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
}

class BaseWireFrame {

    fileprivate unowned var _viewController: BaseView

    //to retain view controller reference upon first access
    fileprivate var _temporaryStoredViewController: BaseView?

    init(viewController: BaseView) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireFrame: BaseWireFrameProtocol {
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
}

extension BaseWireFrame {

    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

}

extension UIViewController {

    func presentWireFrame(_ wireframe: BaseWireFrame, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }

}

extension UINavigationController {

    func pushWireFrame(_ wireframe: BaseWireFrame, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireFrame(_ wireframe: BaseWireFrame, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }

}
