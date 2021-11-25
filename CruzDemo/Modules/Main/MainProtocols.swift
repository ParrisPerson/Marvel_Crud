 

import UIKit

protocol MainViewProtocol: BaseViewProtocol {
    var presenter: MainPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func reloadTable()
}

protocol MainWireFrameProtocol: BaseWireFrameProtocol {
    static func createModule() -> BaseView
    
    // PRESENTER -> WIREFRAME
    func goToFicha(superH: Super)
   
}

protocol MainPresenterProtocol: BasePresenterProtocol {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    
    func getHeroes() -> [Super]
    func goDetail(superH: Super)
    
}

protocol MainInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func getSuccess(data: [Super])
     
    func getError() 
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getSupers()
    
}
