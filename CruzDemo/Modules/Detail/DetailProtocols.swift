 

import UIKit

protocol DetailViewProtocol: BaseViewProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func reloadTable()
}

protocol DetailWireFrameProtocol: BaseWireFrameProtocol {
    static func createModule(superH: Super) -> BaseView
    
    // PRESENTER -> WIREFRAME
   
   
}

protocol DetailPresenterProtocol: BasePresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    
    var superH : Super? { get set }
    // VIEW -> PRESENTER
    
    func getHero() -> Super
    
}

protocol DetailInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    
    
}
