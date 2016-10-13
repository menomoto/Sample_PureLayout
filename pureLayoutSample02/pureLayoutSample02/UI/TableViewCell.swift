import UIKit

class SearchTableViewCell: UITableViewCell {
    // MARK: - View Elements
    let itemImageView: UIImageView
    let titleLabel: UILabel
    let priceLabel: UILabel
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        itemImageView = UIImageView.newAutoLayoutView()
        titleLabel = UILabel.newAutoLayoutView()
        priceLabel = UILabel.newAutoLayoutView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func addSubviews() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func configureSubviews() {}
    
    private func addConstraints() {
        itemImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2.0)
        itemImageView.autoPinEdgeToSuperviewEdge(.Leading, withInset: 2.0)
        itemImageView.autoConstrainAttribute(
            .Width,
            toAttribute: .Height,
            ofView: self,
            withOffset: -4.0
        )
        itemImageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 2.0)
        
        titleLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: itemImageView, withOffset: 4.0)
        titleLabel.autoPinEdgeToSuperviewEdge(.Trailing, withInset: 5.0)
        
        priceLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: itemImageView, withOffset: 4.0)
        priceLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel)
    }
    
    func configureView(auction: Auction) {
        itemImageView.image = auction.image
        titleLabel.text = auction.title
        priceLabel.textColor = UIColor.redColor()
        priceLabel.text = String(auction.price) + "円"
    }
}
