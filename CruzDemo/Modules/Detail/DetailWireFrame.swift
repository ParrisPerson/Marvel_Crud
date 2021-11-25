 //
 //  DetailWireFrame.swift
 //  CruzDemo
 //
 //  Created by Parris Person on 7/11/21.
 //

import UIKit

class DetailWireFrame: BaseWireFrame {
    
    class func createModule(superH: Super) -> BaseView {
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame(viewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.superH = superH  
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

extension DetailWireFrame: DetailWireFrameProtocol {
 
    
   
 
}

