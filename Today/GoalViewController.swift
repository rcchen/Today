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
    @IBOutlet weak var goalHistory: UITableView!

    // MARK: - Controller variables
    var history = [History]()
    
    // MARK: - Data retrieval

    private func loadHistory() {

        // Define the potential categories
        let startHistoryCategory = HistoryCategory(categoryName: "Start", categoryImageName: "HistoryStart")
        let checkpointHistoryCategory = HistoryCategory(categoryName: "Checkpoint", categoryImageName: "HistoryUpdate")
        let finishHistoryCategory = HistoryCategory(categoryName: "Finish", categoryImageName: "HistoryFinish")

        // Add all the records to the history log

        let startHistory = History(category: startHistoryCategory, description: "Task created", timestamp: NSDate())
        history.append(startHistory)

        let checkpointHistory = History(category: checkpointHistoryCategory, description: "Met with group members to finalize bridge design", timestamp: NSDate())
        history.append(checkpointHistory)

        let checkpointHistory2 = History(category: checkpointHistoryCategory, description: "Built the bridge, assigned parts for the report. Only need to finish writing part of the report and prepare to turn it in.", timestamp: NSDate())
        history.append(checkpointHistory2)

        let finishHistory = History(category: finishHistoryCategory, description: "Task finished", timestamp: NSDate())
        history.append(finishHistory)
        
        // Reverse the order
        history = history.reverse()
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

        var cell = tableView.dequeueReusableCellWithIdentifier(GoalHistoryTableCellIdentifier) as GoalHistoryTableCell
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

    /*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
[self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
[self.prototypeCell layoutIfNeeded];

CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
return size.height+1;
}
*/
//
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        var cell = tableView.dequeueReusableCellWithIdentifier(GoalHistoryTableCellIdentifier) as GoalHistoryTableCell
//        let record = history[indexPath.row]
//        cell.recordDescription.text = record.description
//        var size = cell.recordDescription.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//        println(size.height)
//        return size.height + 1
//    }

    func computeLabelSize(label: UILabel) {
    }
}
