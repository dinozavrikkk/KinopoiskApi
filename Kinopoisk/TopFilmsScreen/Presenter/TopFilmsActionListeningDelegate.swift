
import Foundation

protocol TopFilmsActionListeningDelegate: AnyObject {
    func viewIsReady()
    func viewWillReachFilmLimit()
    var filmsCount: Int { get }
    func film(for indexPath: IndexPath) -> Film
}
