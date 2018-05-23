//
//  TableViewController.swift
//  Filtered
//
//  Created by JOSE GUADALUPE TORRES FUENTES on 22/05/18.
//  Copyright © 2018 DragonSoft. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let filters = [
        "Blue",
        "Green",
        "Yellow"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource? = self
        tableView.delegate? = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = filters[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         print(filters[indexPath.row])
    }

}
