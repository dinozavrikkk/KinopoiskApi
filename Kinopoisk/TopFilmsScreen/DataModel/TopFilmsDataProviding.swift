
import Foundation
import UIKit

protocol TopFilmsDataProviding {
    func gettingData(completion: @escaping (Result<Kino, Error>) -> Void)
}


