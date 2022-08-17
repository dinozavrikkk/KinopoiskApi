
import Foundation

protocol FilmsDataStorageProtocol {
    
    func fillingFilmsWithData(data: Kino)
    func transmittingFilmsArray() -> [Film]
    func numberOfRowsInSection() -> Int
    func getFilm(for indexPath: IndexPath) -> Film
    
}
