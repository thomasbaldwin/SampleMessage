//
//  MessageTableViewController.swift
//  SampleMessage
//
//  Created by Thomas Baldwin on 8/26/15.
//  Copyright (c) 2015 Thomas Baldwin. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    let messageCellReuseIdentifier = "MessageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        title = "Thomas Baldwin"
        
        tableView.registerClass(MessageTableViewCell.self, forCellReuseIdentifier: messageCellReuseIdentifier)
        
        tableView.allowsSelection = true
        tableView.backgroundColor = .whiteColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(messageCellReuseIdentifier, forIndexPath: indexPath) as! MessageTableViewCell
        
        return cell
    }
}

