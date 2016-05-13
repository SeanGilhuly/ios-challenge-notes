//
//  NoteDetailTableViewController.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import UIKit

class NoteDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    // MARK: This tells the number of rows to return in NoteDetailTV
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return NoteController.sharedController.notes.count
    }

    // MARK: UITableViewDataSource
    // MARK: This sets the cell for the note created.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)

        let enteredNote = NoteController.sharedController.notes[indexPath.row]
        
        cell.textLabel?.text = enteredNote.title

        return cell
    }
 
    // MARK: - ComitEditingStyle
    // MARK: This allows a user to swipe to delete row in NoteDetailTVC
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let removeSpecificRow = NoteController.sharedController.notes[indexPath.row]
            
            NoteController.sharedController.removeNote(removeSpecificRow)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    // MARK: - Navigation - PrepareForSegue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editNote" {
            
            //Make the "let" similiar to the actual view controller name
            if let NoteListViewController = segue.destinationViewController as? NoteListViewController,
                let selectedNote = tableView.indexPathForSelectedRow?.row {
                        let note = NoteController.sharedController.notes[selectedNote]
                        NoteListViewController.note = note
                
            }
        }
    }
}