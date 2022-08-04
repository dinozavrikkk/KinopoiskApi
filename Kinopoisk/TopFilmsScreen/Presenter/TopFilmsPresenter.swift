
import Foundation
import UIKit

final class TopFilmsPresenter {
    
    private let dataProvider: TopFilmsDataProviding
    private weak var viewController: TopFilmsControllerDelegate?
    
    init(dataProvider: TopFilmsDataProviding, viewController: TopFilmsControllerDelegate?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

//MARK: TopFilmsActionListeningDelegate
extension TopFilmsPresenter: TopFilmsActionListeningDelegate {
    
    func dataTransmission(pagination: Bool = false) {
        dataProvider.gettingData(pagination: pagination) { [weak self] result in
            switch result {
            case .success(let model):
                self?.viewController?.fetchModel(data: model)
            case .failure(let error):
                print(error)
            }
        }
    }
}

