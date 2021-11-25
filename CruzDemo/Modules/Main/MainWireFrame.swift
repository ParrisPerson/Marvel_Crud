//
//  SplashWireFrame.swift
//  Lendu
//
//   
//

import UIKit

class MainWireFrame: BaseWireFrame {
    
    class func createModule() -> BaseView {
        let view = MainView()
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol = MainInteractor()
        let wireFrame: MainWireFrameProtocol = MainWireFrame(viewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

extension MainWireFrame: MainWireFrameProtocol { 
 
    func goToFicha(superH: Super){
        let detailScreen = DetailWireFrame.createModule(superH: superH)
        navigationController?.pushViewController(detailScreen, animated: true)
    }
 
}

