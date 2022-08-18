
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
        presenter?.viewIsReady()
        updateNavBarTitle()
    }

}

//MARK: UITableViewDelegate, UITableViewDataSource 
extension TopFilmsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.filmsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopFilmsTableViewCell", for: indexPath) as? TopFilmsTableViewCell
        else {
            return UITableViewCell()
        }
        if let model = presenter?.film(for: indexPath) {
            cell.update(model: model)
        } else {
            print("Ячейки не заполнились")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfCellsAtTheBottomOfTheTable = 5
        guard indexPath.item + numberOfCellsAtTheBottomOfTheTable >= presenter?.filmsCount ?? 0 else { return }
        presenter?.viewWillReachFilmLimit()
    }
    
}

//MARK: TopFilmsControllerDelegate
extension TopFilmsViewController: TopFilmsControllerDelegate {
    
    func fetchModel() {
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

