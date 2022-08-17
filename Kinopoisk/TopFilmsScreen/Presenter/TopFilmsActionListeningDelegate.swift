
import Foundation

protocol TopFilmsActionListeningDelegate: AnyObject {
    func viewIsReady()
    func viewWillReachFilmLimit()
    func returnTheNumberOfFilms() -> Int
    func returnTheFilms(for indexPath: IndexPath) -> Film
}
