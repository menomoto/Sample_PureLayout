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
        searchBar = UISearchBar.newAutoLayout()
        label = UILabel.newAutoLayout()
        textField = UITextField.newAutoLayout()
        
        let image:UIImage = UIImage(named: "sample01.gif")!
        imageView = UIImageView.newAutoLayout()
        imageView = UIImageView(image:image)
        imageView.contentMode = .scaleAspectFit
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
        searchBar.autoPin(toTopLayoutGuideOf: self, withInset: 0)
        searchBar.autoPinEdge(toSuperviewEdge: .left)
        searchBar.autoPinEdge(toSuperviewEdge: .right)

        label.autoPinEdge(.top, to: .bottom, of: searchBar, withOffset: 10.0)
        label.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        label.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        
        textField.autoPinEdge(.top, to: .bottom, of: label, withOffset: 10.0)
        textField.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)

        imageView.autoPinEdge(.top, to: .bottom, of: textField, withOffset: 10.0)
        imageView.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        imageView.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)

        //imageView.autoSetDimensionsToSize(CGSize(width: 192, height: 192))
    }
    
    private func configureSubviews() {
        searchBar.placeholder = "UISearchBar"
        
        label.text = "Pure Layout Sample 01"
        
        textField.placeholder = "UItextField"
        textField.layer.borderWidth = 1
        
    }
    
}

