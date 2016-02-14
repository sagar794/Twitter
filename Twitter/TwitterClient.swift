//
//  TwitterClient.swift
//  Twitter
//
//  Created by Sagar  on 2/14/16.
//  Copyright © 2016 Sagar . All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "sqEPsMQbl1lriLH64RwPKfib0"
let twitterConsumerSecret = "CmxHG5xvMwYbtUJlciJ9L4jru6LP4W0S0Fly5bGIzFyfNdjnIG"

let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient{
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }

}
