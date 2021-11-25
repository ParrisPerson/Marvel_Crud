 

import Foundation
import Alamofire

class MainInteractor: NSObject, MainInteractorInputProtocol {
    
    weak var presenter: MainInteractorOutputProtocol?
 
    func getSupers() {
        SuperRemoteDataManager.sharedInstance.getAll ( { (response: GlobalResponse<SuperResponse>) in
            self.presenter?.getSuccess(data: response.data!.results!)
        }) { (error: GlobalResponse<SuperResponse>) in
            self.presenter?.getError()
        }
    }
}
