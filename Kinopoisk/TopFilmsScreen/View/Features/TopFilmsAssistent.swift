
import Foundation
import UIKit

final class TopFilmsAssistent {
    
    private var array: [Film] = []
    
    static let shared: TopFilmsAssistent = TopFilmsAssistent()
    
    private init() { }
    
    func fillingArrayWithData(data: Kino) {
        for model in data.films {
            array.append(model)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        array.count
    }
    
    func getFilm(for indexPath: IndexPath) -> Film {
        array[indexPath.row]
    }
    
}
