//
//  PlayersTableViewController.swift
//  StroryboardRatings
//
//  Created by WangQi on 16/7/9.
//  Copyright © 2016年 WangQi. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
    @IBAction func cancelToPlayersViewController(segue: UIStoryboardSegue) {}
    @IBAction func savePlayerDetail(segue: UIStoryboardSegue) {
        if let playerDetailsTableViewController = segue.sourceViewController as? PlayerDetailsTableViewController {
//            
//            // add new player to the players array
           if  let player = playerDetailsTableViewController.player {
                players.append(player)
//                
//                // update the tableView
                let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                /*
                 This obtains a reference to the PlayerDetailsTableViewController via the segue reference passed to the method. It uses that to add the new Player object to the array of players used in the datasoure. Then it tells the table view that a new row was added at the bottom, because the table view and its data source must always be in sync.
                 You could have just done tabelView.reloadData() but it looks nicer to insert the new row with an animation.
                 UITabelViewRowAnimation.Automatic automatially picks the proper animaton, depending on where you insert thenew row. Very handy.
                 */
            }
        }
    }
    
    var players: [Player] = playersData
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerTableViewCell
        // dequeueReusableCellWithIdentifier will dequeue an existing cell with the reuse identifier Player Cell if available or create a new one if not.

        let player = players[indexPath.row] as Player

         cell.player = player
        return cell
    }

}
