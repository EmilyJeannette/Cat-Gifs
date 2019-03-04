//
//  ViewController.swift
//  Cat Gifs
//
//  Created by Emily Kirk on 3/4/19.
//  Copyright © 2019 Emily Kirk. All rights reserved.
//

import UIKit

class GifsViewController: UITableViewController {
    var data = [[String: String]]()
    let apiKey = "SFiDD63MScry4l67i6NT9Jxqqlc1DDGH"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Cat Gifs"
        let query = "This call to http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=\(apiKey)"
    }


}

