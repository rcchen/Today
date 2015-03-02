//
//  GoalViewController.swift
//  Today
//
//  Created by Roger Chen on 3/1/15.
//  Copyright (c) 2015 Roger Chen. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    // MARK: - Constants
    // TODO: - Break out these constants into a separate file if I keep using them over and over again

    let GoalHistoryTableCellIdentifier = "GoalHistoryTableCell"
    
    // MARK: - IBOutlets

    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalTags: UILabel!
    @IBOutlet weak var goalDue: UILabel!

    // MARK: - Controller variables
    var history = [History]()
    
    // MARK: - Data retrieval

    private func loadHistory() {
        let startHistoryCategory = HistoryCategory(categoryName: "Start", categoryImageName: "HistoryStart")
        let startHistory = History(category: startHistoryCategory, description: "Task created", timestamp: NSDate())
        history.append(startHistory)
    }

    private func loadTags() {
        // TODO: - Replace with actual tag implementation
        let tags = ["e14", "project"]

        var tagsLabel = NSMutableAttributedString()
        for tag in tags {
            var tagLabel = NSMutableAttributedString(string: "\(tag) ")
            let tagRange = NSMakeRange(0, countElements(tag))
            tagsLabel.appendAttributedString(tagLabel)
        }
        goalTags.attributedText = tagsLabel
    }

    // MARK: - UIViewController overrides

    override func viewDidLoad() {
        loadTags()
        loadHistory()
    }

    // MARK: - UITableViewDataSource overrides

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier(GoalHistoryTableCellIdentifier, forIndexPath: indexPath) as GoalHistoryTableCell
        let record = history[indexPath.row]

        // Set the correct image
        cell.categoryIcon.image = UIImage(named: record.category.categoryImageName)

        // Set the correct timestamp
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        cell.recordTimestamp.text = dateFormatter.stringFromDate(record.timestamp)

        // Set the correct description
        cell.recordDescription.text = record.description

        return cell
    }


}
