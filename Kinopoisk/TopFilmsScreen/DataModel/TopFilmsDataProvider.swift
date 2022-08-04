
import Foundation
import UIKit

final class TopFilmsDataProvider {
    
    private var isPaginating = false
    private let queue = DispatchQueue(label: "com.TopFilmsDataProvider.URLSession", qos: .userInteractive, attributes: .concurrent)
    
}

//MARK: TopFilmsDataProviding
extension TopFilmsDataProvider: TopFilmsDataProviding {
    
    func gettingData(pagination: Bool = false, completion: @escaping (Result<Kino, Error>) -> Void) {
//        if pagination {
//            isPaginating.toggle()
//        }
        queue.async {
            guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top") else { return }
            var request = URLRequest(url: url)
            request.setValue("c3b53a94-80d5-41b3-a667-2424d1bfd9ad", forHTTPHeaderField: "X-API-KEY")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data, let topFilms = try? JSONDecoder().decode(Kino.self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(topFilms))
//                        if pagination {
//                            self.isPaginating.toggle()
//                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(error!))
                    }
                }
            }
            task.resume()
        }
    }
    
}
