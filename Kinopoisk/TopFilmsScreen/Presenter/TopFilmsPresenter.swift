
import Foundation
import UIKit

final class TopFilmsPresenter {
    
    private let dataProvider: TopFilmsDataProvidingProtocol
    private weak var viewController: TopFilmsControllerDelegate?
    
    init(dataProvider: TopFilmsDataProvidingProtocol, viewController: TopFilmsControllerDelegate?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

//MARK: TopFilmsActionListeningDelegate
extension TopFilmsPresenter: TopFilmsActionListeningDelegate {
   
    private func dataTransmission() {
        dataProvider.gettingData { [weak self] _ in
            self?.viewController?.fetchModel()
        }
    }
    
    func viewIsReady() {
        dataTransmission()
    }
    
    func viewWillReachFilmLimit() {
        dataTransmission()
    }
    
    var filmsCount: Int {
        dataProvider.getTheNumberOfFilms()
    }
    
    func film(for indexPath: IndexPath) -> Film {
        dataProvider.gettingFilmForCell(for: indexPath)
    }
    
    
}

