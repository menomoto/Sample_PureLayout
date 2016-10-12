import UIKit
import PureLayout

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    // MARK: - View Elements
    let searchBar: UISearchBar
    let label: UILabel
    let textField: UITextField
    var imageView: UIImageView
    
    // MARK: - Initializers
    init() {
        searchBar = UISearchBar.newAutoLayoutView()
        label = UILabel.newAutoLayoutView()
        textField = UITextField.newAutoLayoutView()
        
        let image:UIImage = UIImage(named: "sample01.gif")!
        imageView = UIImageView.newAutoLayoutView()
        imageView = UIImageView(image:image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit

        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        configureNavigationBar()
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    private func configureNavigationBar() {}
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(imageView)
    }
    
    private func addConstraints() {
        searchBar.autoPinToTopLayoutGuideOfViewController(self, withInset: 0)
        searchBar.autoPinEdgeToSuperviewEdge(.Left)
        searchBar.autoPinEdgeToSuperviewEdge(.Right)

        label.autoPinEdge(.Top, toEdge: .Bottom, ofView: searchBar, withOffset: 10.0)
        label.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        label.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        
        textField.autoPinEdge(.Top, toEdge: .Bottom, ofView: label, withOffset: 10.0)
        textField.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)

        imageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: textField, withOffset: 10.0)
        imageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)

        //imageView.autoSetDimensionsToSize(CGSize(width: 192, height: 192))
    }
    
    private func configureSubviews() {
        searchBar.placeholder = "UISearchBar"
        
        label.text = "Pure Layout Sample 01"
        
        textField.placeholder = "UItextField"
        textField.layer.borderWidth = 1
        
    }
    
}

