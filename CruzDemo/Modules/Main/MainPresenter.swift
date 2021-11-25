 

import Foundation

 class MainPresenter: MainPresenterProtocol {
 

    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
    
    var heroes : [Super] = []
    
    func viewDidLoad() {
        self.view?.showProgress()
        interactor!.getSupers()
    }
    
    func getHeroes() -> [Super]{
        return heroes
    }
    
    func goDetail(superH: Super){
        wireFrame?.goToFicha(superH: superH)
    }
 
}

extension MainPresenter: MainInteractorOutputProtocol {
    func getSuccess(data: [Super]){
        heroes = data
        self.view?.hideProgress()
        self.view!.reloadTable() 
    }
     
    func getError(){
        self.view?.hideProgress()
        self.view?.showErrorToast(message: "Fallo recuperando datos", completion: {})
    }
}
