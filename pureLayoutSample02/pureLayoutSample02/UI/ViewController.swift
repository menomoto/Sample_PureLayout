import UIKit
import PureLayout

struct Auction {
    var auctionId: String = ""
    var title: String = ""
    var price: Int = 0
    var imageUrl: String = ""
    var image: UIImage = UIImage()
}

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    private var auctions: [Auction]

    // MARK: - View Elements
    let searchBar: UISearchBar
    let tableView: UITableView
    
    // MARK: - Initializers
    init() {
        auctions = [Auction]()
        self.searchBar = UISearchBar.newAutoLayoutView()
        self.tableView = UITableView.newAutoLayoutView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        self.searchBar.becomeFirstResponder()
        
        configureNavigationBar()
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    private func configureNavigationBar() {}
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func configureSubviews() {
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(
            SearchTableViewCell.self,
            forCellReuseIdentifier: String(SearchTableViewCell)
        )
    }

    private func addConstraints() {
        searchBar.autoPinToTopLayoutGuideOfViewController(self, withInset: 0)
        searchBar.autoPinEdgeToSuperviewEdge(.Left)
        searchBar.autoPinEdgeToSuperviewEdge(.Right)
        
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: searchBar)
        tableView.autoPinEdgeToSuperviewEdge(.Left)
        tableView.autoPinEdgeToSuperviewEdge(.Right)
        tableView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
    
}


// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let query = searchBar.text {
            auctions = ApiClient.request(Urls.search.rawValue + query)
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auctions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier( String(SearchTableViewCell) ) as? SearchTableViewCell
        {
            cell.configureView(auctions[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
}
