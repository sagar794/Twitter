//
//  TweetCell.swift
//  Twitter
//
//  Created by Sagar  on 2/20/16.
//  Copyright © 2016 Sagar . All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var retweetLabel: UILabel!
    var tweet: Tweet! {
        didSet {
            tweetLabel.text = tweet.text
            timeStampLabel.text = tweet.timestamp as? String
            usernameLabel.text = "@" + (tweet.user?.screenname as? String)!
            nameLabel.text = tweet.user?.name as? String
            if let image = tweet.user?.profileUrl{
                profileImage.setImageWithURL((tweet.user?.profileUrl)!)
            }
            likeLabel.text = "\(tweet.favorites_count)"
            retweetLabel.text = "\(tweet.retweetCount)"
    
        }
    }
    
    @IBAction func onLike(sender: AnyObject) {
        TwitterClient.sharedInstance.like(tweet.id!) { (error) -> () in
            if error == nil{
                self.likeLabel.text = "\(Int(self.likeLabel.text!)! + 1)"
            }
        }
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(tweet.id!) { (error) -> () in
            if error == nil{
                self.retweetLabel.text = "\(Int(self.retweetLabel.text!)! + 1)"
            }
        }
    }
    
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
