import UIKit
import PureLayout

class SegmentedControlViewController: UIViewController {
    
    // MARK: - Properties
    struct Constant {
        static let sellType = ["オークション", "定額"]
    }

    // MARK: - View Elements
    let segmentedControl = UISegmentedControl(items: Constant.sellType)
    let sellAuctionTableView = UITableView()
    let sellFixedTableView = UITableView()

    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "価格と個数"
        
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(sellAuctionTableView)
        view.addSubview(sellFixedTableView)
    }
    
    fileprivate func configureSubviews() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeSellType(_:)), for: .valueChanged)
        changeSellType(index: segmentedControl.selectedSegmentIndex)

        sellAuctionTableView.dataSource = self
        sellAuctionTableView.tableFooterView = UIView()
        
        sellFixedTableView.dataSource = self
        sellFixedTableView.tableFooterView = UIView()
    }
    
    fileprivate func addConstraints() {
        segmentedControl.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        segmentedControl.autoAlignAxis(toSuperviewAxis: .vertical)
        
        sellAuctionTableView.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 40)
        sellAuctionTableView.autoPinEdge(toSuperviewEdge: .left)
        sellAuctionTableView.autoPinEdge(toSuperviewEdge: .right)
        sellAuctionTableView.autoPinEdge(toSuperviewEdge: .bottom)

        sellFixedTableView.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 40)
        sellFixedTableView.autoPinEdge(toSuperviewEdge: .left)
        sellFixedTableView.autoPinEdge(toSuperviewEdge: .right)
        sellFixedTableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    @objc fileprivate func didChangeSellType(_ sender: UISegmentedControl) {
        changeSellType(index: sender.selectedSegmentIndex)
    }
    
    fileprivate func changeSellType(index: Int) {
        switch index {
        case 0:
            sellAuctionTableView.isHidden = false
            sellFixedTableView.isHidden = true
            sellAuctionTableView.reloadData()
        case 1:
            sellAuctionTableView.isHidden = true
            sellFixedTableView.isHidden = false
            sellFixedTableView.reloadData()
        default:
            return
        }
    }
}

extension SegmentedControlViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return 5
        case 1:
            return 3
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Constant.sellType[segmentedControl.selectedSegmentIndex] + "\(indexPath.row)"
        return cell
    }
}

