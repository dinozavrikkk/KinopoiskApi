
import Foundation
import UIKit

protocol TopFilmsDataProviding {
    func gettingData(pagination: Bool, completion: @escaping (Result<Kino, Error>) -> Void)
}


