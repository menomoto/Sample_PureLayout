import UIKit
import PureLayout

class TabBarController: UITabBarController {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()
    let fourthVC = FourthViewController()
    let fifthVC = FifthViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstVC.tabBarItem  = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured,   tag: 1)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks,  tag: 2)
        thirdVC.tabBarItem  = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Search,     tag: 3)
        fourthVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts,   tag: 4)
        fifthVC.tabBarItem  = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.More,       tag: 5)
        let defaultTabs = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        
        self.setViewControllers(defaultTabs, animated: false)
    }
}

class FirstViewController: UIViewController {
    let label: UILabel
    
    init() {
        self.label = UILabel.newAutoLayoutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(label)
        label.setLayout
        label.text = String(self.tabBarItem.tag)
    }
}

class SecondViewController: UIViewController {
    let label: UILabel
    
    init() {
        self.label = UILabel.newAutoLayoutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        view.addSubview(label)
        label.setLayout
        label.text = String(self.tabBarItem.tag)
    }
}

class ThirdViewController: UIViewController {
    let label: UILabel
    
    init() {
        self.label = UILabel.newAutoLayoutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.8, alpha: 1)
        
        view.addSubview(label)
        label.setLayout
        label.text = String(self.tabBarItem.tag)
    }
}

class FourthViewController: UIViewController {
    let label: UILabel
    
    init() {
        self.label = UILabel.newAutoLayoutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.7, alpha: 1)
        
        view.addSubview(label)
        label.setLayout
        label.text = String(self.tabBarItem.tag)
    }
}

class FifthViewController: UIViewController {
    let label: UILabel
    
    init() {
        self.label = UILabel.newAutoLayoutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.6, alpha: 1)
        
        view.addSubview(label)
        label.setLayout
        label.text = String(self.tabBarItem.tag)
    }
}


extension UILabel {
    var setLayout: UILabel {
        self.autoAlignAxisToSuperviewAxis(.Horizontal)
        self.autoAlignAxisToSuperviewAxis(.Vertical)
        self.font = UIFont.systemFontOfSize(CGFloat(256))
        
        return self
    }
}
