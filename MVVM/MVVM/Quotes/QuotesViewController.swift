import UIKit

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var viewModel: QuotesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getDataFromViewModel()
    }
    
    func setupUI() {
        tblView.delegate = self
        tblView.dataSource = self
        self.navigationItem.title = "Quotes"
    }
    
    func getDataFromViewModel() {
        self.viewModel = QuotesViewModel()
        self.viewModel.bindEmployeeViewModelToController = {
            self.tblView.reloadData()
        }
    }
}

extension QuotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text =  viewModel.quotes![indexPath.row].quote
        return cell
    }
}

extension QuotesViewController: UITableViewDelegate {
    
}
