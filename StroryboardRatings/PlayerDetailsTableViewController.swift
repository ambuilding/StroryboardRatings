//
//  PlayerDetailsTableViewController.swift
//  StroryboardRatings
//
//  Created by WangQi on 16/7/10.
//  Copyright © 2016年 WangQi. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!

    var player:Player?

    var game: String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        print("init PlayerDetailsViewController")
//        super.init(coder: aDecoder)
//    }
//    
//    deinit {
//        print("deinit PlayerDetailsViewController")
//    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
            // let a tap anywhere in that row bring up the keyboard

        }
    }
    // MARK: - Table view data source


    
    // MARK: - Navigation
    
    // create a new Player instance with default values for game and rating. It does this only for a segue that has teh identifier of SavePlayerDetail

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let gamePickerTableViewController = segue.sourceViewController as? GamePickerTableViewController, selectedGame = gamePickerTableViewController.selectedGame {
            game = selectedGame
        }
        /* 
         this code will executed once the user selects a game from the Choose Game Scene.
         this method updates both the label on screen and the game property based on the game selected.
         The unwind segue also pops GamePickerViewController off the navigation controller's stack.
         */
    }
}
