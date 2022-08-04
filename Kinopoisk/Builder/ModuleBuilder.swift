
import Foundation
import UIKit

enum ModuleBuilder {
    
    static func assemblyMainController() -> UIViewController {
        let dataProvider = TopFilmsDataProvider()
        let viewController = TopFilmsViewController()
        let presenter = TopFilmsPresenter(dataProvider: dataProvider, viewController: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
}
