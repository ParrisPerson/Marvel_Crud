 

import Foundation

 class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    var superH : Super?
    
    func viewDidLoad() {
        
    }
    
    func getHero() -> Super{
        return superH!
    }
 
}

extension DetailPresenter: DetailInteractorOutputProtocol {
   
}
