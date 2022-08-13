
import Foundation
import UIKit

final class TopFilmsDataProvider {
    

    
}

//MARK: TopFilmsDataProviding
extension TopFilmsDataProvider: TopFilmsDataProviding {
    
    func gettingData(completion: @escaping (Result<Kino, Error>) -> Void) {
        Service.shared.goingOnline { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
