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

    @IBAction func presentSheet(sender: NSButton) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: Bundle.main)
        let sheet = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("sheet")) as! ViewController
        self.presentAsSheet(sheet)
    }

    @IBAction func closeSheet(sender: NSButton) {
        dismiss(self)
    }

}

extension NSPredicateEditorRowTemplate {
    
    static func feedbackTemplates() -> [NSPredicateEditorRowTemplate] {
        
        let compound = NSPredicateEditorRowTemplate(compoundTypes: [NSCompoundPredicate.LogicalType.and, .not, .or].map({ $0.rawValue as NSNumber }))
        
        let row1 = NSPredicateEditorRowTemplate(leftExpressions: [NSExpression(forKeyPath: "freeform")],
                                                  rightExpressionAttributeType: .stringAttributeType,
                                                  modifier: .direct,
                                                  operators: [NSComparisonPredicate.Operator.equalTo.rawValue as NSNumber],
                                                  options: 0)
        
        let row2 = NSPredicateEditorRowTemplate(leftExpressions: [NSExpression(forKeyPath: "single select")],
                                                 rightExpressions: [NSExpression(forKeyPath: "option 1")],
                                                 modifier: .direct,
                                                 operators: [NSComparisonPredicate.Operator.equalTo.rawValue as NSNumber],
                                                 options: 0)
        
        let row3 = NSPredicateEditorRowTemplate(leftExpressions: [NSExpression(forKeyPath: "multi select")],
                                                rightExpressions: [NSExpression(forKeyPath: "option 1"),
                                                                   NSExpression(forKeyPath: "option 2"),
                                                                   NSExpression(forKeyPath: "option 3")],
                                                modifier: .direct,
                                                operators: [NSComparisonPredicate.Operator.equalTo.rawValue as NSNumber,
                                                            NSComparisonPredicate.Operator.lessThan.rawValue as NSNumber,
                                                            NSComparisonPredicate.Operator.greaterThan.rawValue as NSNumber],
                                                options: 0)
        
        return [
            compound,
            row1,
            row2,
            row3,
        ]
    }
    
}
