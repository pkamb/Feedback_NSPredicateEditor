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
        
        predicateEditor.rowTemplates = NSPredicateEditorRowTemplate.feedbackTemplates()
        predicateEditor.addRow(self)
    }
    
    @IBAction func presentStandardSheet(sender: NSButton) {
        let vc = ViewController.fromStoryboard()
        self.presentAsSheet(vc)
    }
    
    @IBAction func presentFixedSheet(sender: NSButton) {
        let vc = ViewController.fromStoryboard()
        self.presentAsSheet(vc)
    }
    
    @IBAction func closeSheet(sender: NSButton) {
        dismiss(self)
    }
    
    static func fromStoryboard() -> ViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: Bundle.main)
        let sheet = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("sheet")) as! ViewController
        return sheet
    }
    
}
