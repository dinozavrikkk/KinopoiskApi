
import Foundation
import UIKit

final class TopFilmsAssistent {
    
    private var filmsArray: [Film] = []
    
    static let shared: TopFilmsAssistent = TopFilmsAssistent()
    
    private init() { }
    
    func fillingArrayWithData(data: Kino) {
        filmsArray += data.films
    }
    
    func numberOfRowsInSection() -> Int {
        filmsArray.count
    }
    
    func getFilm(for indexPath: IndexPath) -> Film {
        filmsArray[indexPath.row]
    }
    
}
