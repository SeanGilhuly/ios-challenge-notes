//
//  NoteListViewController.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var textViewField: UITextView!
    
   
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let note = note {
            updateWithEntry(note)
        }
    }

    // MARK: IBActions
    @IBAction func saveButton(sender: AnyObject) {
        guard let note = note else {
            let newNote = Note(timeStamp: NSDate(), title: enterTextField.text ?? "", bodyText: textViewField.text ?? "")
            NoteController.sharedController.addNote(newNote)
            self.navigationController?.popToRootViewControllerAnimated(true)
            return
            }
            note.title = enterTextField.text ?? ""
            note.bodyText = textViewField.text ?? ""
        
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
  
    
    @IBAction func clearButton(sender: AnyObject) {
        enterTextField.text = ""
        textViewField.text = ""
    }
    
    //MARK: - Update Entry
    func updateWithEntry(note: Note) {
        self.note = note
        
        self.enterTextField.text = note.title
        self.textViewField.text = note.bodyText
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
 
        textField.resignFirstResponder()
        
        return true
    }
}
