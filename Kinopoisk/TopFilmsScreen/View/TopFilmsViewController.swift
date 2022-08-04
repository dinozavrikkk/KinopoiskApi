
import UIKit

final class TopFilmsViewController: UIViewController {
    
    private let topFilmView = TopFilmsView()
    var presenter: TopFilmsActionListeningDelegate?
    
    override func loadView() {
        view = topFilmView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customizationTableView()
        presenter?.dataTransmission(pagination: false)
        updateNavBarTitle()
    }

}

//MARK: UITableViewDelegate, UITableViewDataSource 
extension TopFilmsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TopFilmsAssistent.shared.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopFilmsTableViewCell", for: indexPath) as? TopFilmsTableViewCell
        else {
            return UITableViewCell()
        }
        cell.update(model: TopFilmsAssistent.shared.getFilm(for: indexPath))
        return cell
    }
    
}

extension TopFilmsViewController: UIScrollViewDelegate {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        if position > (topFilmView.tableView.contentSize.height - 100 - scrollView.frame.size.height) {
//            presenter?.dataTransmission(pagination: true)
//            topFilmView.tableView.reloadData()
//            print("warning")
//        }
//    }
    
}

//MARK: TopFilmsControllerDelegate
extension TopFilmsViewController: TopFilmsControllerDelegate {
    
    func fetchModel(data: Kino) {
        TopFilmsAssistent.shared.fillingArrayWithData(data: data)
        topFilmView.tableView.reloadData()
    }

}

//MARK: CustomizeTableView
private extension TopFilmsViewController {
    
    func customizationTableView() {
        topFilmView.tableView.delegate = self
        topFilmView.tableView.dataSource = self
        topFilmView.tableView.register(TopFilmsTableViewCell.self, forCellReuseIdentifier: "TopFilmsTableViewCell")
        topFilmView.tableView.separatorStyle = .none
        topFilmView.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func updateNavBarTitle() {
        title = "Топ 250 фильмов"
    }
    
}

