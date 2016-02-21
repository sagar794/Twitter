//
//  Tweet.swift
//  Twitter
//
//  Created by Sagar  on 2/20/16.
//  Copyright © 2016 Sagar . All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favorites_count: Int = 0
    var user: User?
    var id: String?
    
    init(dictionary: NSDictionary){
        user =  User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        retweetCount  = (dictionary["retweet_count"] as? Int) ?? 0
        favorites_count = (dictionary["favourites_count"] as? Int) ?? 0
        id = dictionary["id_str"] as? String
        let timestampString = dictionary["create_at"] as? String
        
       if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
    }

    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries{
            let tweet  = Tweet(dictionary:dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}//CLASS BRACE
