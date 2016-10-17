import UIKit
import PureLayout

struct Auction {
    var auctionId: String = ""
    var title: String = ""
    var price: Int = 0
    var imageUrl: String = ""
    var image: UIImage = UIImage()
    var bidCount: Int = 0
    var endTime: String = ""
}

class SearchViewController: UIViewController {
    
    
    // MARK: - Properties
    private var auctions: [Auction]
    
    // MARK: - View Elements
    let searchBar: UISearchBar
    let collectionView: UICollectionView
    
    // MARK: - Initializers
    init() {
        auctions = [Auction]()
        self.searchBar = UISearchBar.newAutoLayoutView()
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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
        view.addSubview(collectionView)
    }
    
    private func configureSubviews() {
        searchBar.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(SearchCollectionViewCell.self, forCellWithReuseIdentifier: String(SearchCollectionViewCell))
        collectionView.backgroundColor = UIColor.whiteColor()
    }
    
    private func addConstraints() {
        searchBar.autoPinToTopLayoutGuideOfViewController(self, withInset: 0)
        searchBar.autoPinEdgeToSuperviewEdge(.Left)
        searchBar.autoPinEdgeToSuperviewEdge(.Right)
        
        collectionView.autoPinEdge(.Top, toEdge: .Bottom, ofView: searchBar)
        collectionView.autoPinEdgeToSuperviewEdge(.Left)
        collectionView.autoPinEdgeToSuperviewEdge(.Right)
        collectionView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
    
}


// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let query = searchBar.text {
            auctions = ApiClient.request(Urls.search.rawValue + query)
            collectionView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return auctions.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(SearchCollectionViewCell), forIndexPath: indexPath ) as? SearchCollectionViewCell
        {
            cell.configureView(auctions[indexPath.row])
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)

            return cell
        }
        return UICollectionViewCell()
    }
        
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenSize:CGSize = UIScreen.mainScreen().bounds.size
        let width = ( screenSize.width - (10 * 3) ) / 2
        let cellSize: CGSize = CGSizeMake( width, width * 1.2 )
        return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
