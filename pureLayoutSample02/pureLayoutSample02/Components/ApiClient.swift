import UIKit

enum Urls: String {
    case search = "https://auctions.yahooapis.jp/AuctionWebService/V2/json/search?appid=dj0zaiZpPU1aMWppaDVwUFFSTSZzPWNvbnN1bWVyc2VjcmV0Jng9MTc-&results=20&query="
}

// MARK: - ApiClient
class ApiClient {
    
    class func request(url: String) -> [Auction] {
        var auctions = [Auction]()
        
        if let url:NSURL = NSURL(string: url),
            let resultData: NSData = NSData(contentsOfURL: url) {
            let jsonData = resultData.jsonp2Json()
            var json: NSDictionary!
            do {
                json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) as! NSDictionary
            } catch  {
                print("api error")
            }
            if let datas = json["ResultSet"]!["Result"]!!["Item"] as? [[String: AnyObject]] {
                for data in datas {
                    if let auctionId = data["AuctionID"] as? String,
                        let imageUrl = data["Image"] as? String,
                        let price = data["CurrentPrice"] as? String,
                        let title = data["Title"] as? String {
                        var auction = Auction()
                        auction.auctionId = auctionId
                        auction.title = title
                        auction.price = Int(Double(price)!)
                        auction.imageUrl = imageUrl
                        auction.image = UIImage.imageWithUrl(imageUrl)
                        auctions.append(auction)
                    }
                }
            }
        }
        return auctions
    }
    
}


extension UIImage {
    class func imageWithUrl(url: String) -> UIImage {
        let httpsUrl = url.stringByReplacingOccurrencesOfString("http", withString: "https")
        if let imageUrl = NSURL(string: httpsUrl),
            let data = NSData(contentsOfURL: imageUrl),
            let image: UIImage = UIImage(data: data) {
            return image
        }
        
        return UIImage()
    }
}


extension NSData {
    func jsonp2Json() -> NSData {
        if let jsonpString: String = NSString(data: self, encoding:NSUTF8StringEncoding) as? String {
            let jsonString = jsonpString.stringByReplacingOccurrencesOfString("loaded(", withString: "").stringByReplacingOccurrencesOfString(")", withString: "")
            if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
                return data
            }
        }
        return NSData()
    }
}
