
import Foundation
import UIKit

enum ModuleBuilder {
    
    static func assemblyMainController() -> UIViewController {
        let networkService = FilmsNetworkService()
        let dataProvider = TopFilmsDataProvider(networkService: networkService)
        let viewController = TopFilmsViewController()
        let presenter = TopFilmsPresenter(dataProvider: dataProvider, viewController: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
}
