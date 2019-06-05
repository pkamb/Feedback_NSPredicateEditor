//
//  ViewController.swift
//  Feedback_NSPredicateEditor
//
//  Created by Feedback on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var predicateEditor: NSPredicateEditor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        predicateEditor.addRow(self)
    }

    @IBAction func presentSheet(sender: NSButton) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: Bundle.main)
        let sheet = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("sheet")) as! ViewController
        self.presentAsSheet(sheet)
    }

    @IBAction func closeSheet(sender: NSButton) {
        dismiss(self)
    }

}

