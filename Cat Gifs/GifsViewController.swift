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
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["status"] == "ok" {
                    parse(json: json)
                    return
                }
            }
        }
        loadError()
    }
    
    func parse(json: JSON) {
        for result in json["data"].arrayValue {
            let id = result["id"].stringValue
            let title = result["title"].stringValue
            let type = result["type"].stringValue
            let gif = ["id": id, "title": title, "type": type]
            data.append(gif)
        }
        tableView.reloadData()
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem loading the gif",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil) }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let gif = data[indexPath.row]
        cell.textLabel?.text = gif["title"]
        cell.detailTextLabel?.text = gif["type"]
        return cell
    }
}

