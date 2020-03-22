//
//  ViewController.swift
//  Feedback_NSPredicateEditor
//
//  Created by Feedback on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

class FlippedVEV: NSVisualEffectView {
    override var isFlipped: Bool { return true }
}

class ViewController: NSViewController {
    
    var shouldFixPredicateEditor = false
    
    @IBOutlet weak var predicateEditor: NSPredicateEditor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        predicateEditor.rowTemplates = NSPredicateEditorRowTemplate.feedbackTemplates()
        predicateEditor.addRow(self)
        
        if shouldFixPredicateEditor {
            if let clipView = predicateEditor.superview as? NSClipView, let scrollView = clipView.superview as? NSScrollView {
                let flippedVEV = FlippedVEV(frame: predicateEditor.frame)
                flippedVEV.material = .sheet

                predicateEditor.removeFromSuperview()
                flippedVEV.addSubview(predicateEditor)
                clipView.addSubview(flippedVEV)
                scrollView.documentView = flippedVEV
                
                flippedVEV.translatesAutoresizingMaskIntoConstraints = false
                flippedVEV.addConstraints([
                    NSLayoutConstraint(item: flippedVEV, attribute: .leading,  relatedBy: .equal, toItem: predicateEditor, attribute: .leading,  multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: flippedVEV, attribute: .trailing, relatedBy: .equal, toItem: predicateEditor, attribute: .trailing, multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: flippedVEV, attribute: .top,      relatedBy: .equal, toItem: predicateEditor, attribute: .top,      multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: flippedVEV, attribute: .height,   relatedBy: .equal, toItem: predicateEditor, attribute: .height,   multiplier: 1, constant: 0),
                ])
                
                clipView.addConstraints([
                    NSLayoutConstraint(item: clipView, attribute: .leading,  relatedBy: .equal, toItem: flippedVEV, attribute: .leading,  multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: clipView, attribute: .trailing, relatedBy: .equal, toItem: flippedVEV, attribute: .trailing, multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: clipView, attribute: .top,      relatedBy: .equal, toItem: flippedVEV, attribute: .top,      multiplier: 1, constant: 0),
                ])
            }
        }
        
    }
    
    @IBAction func presentStandardSheet(sender: NSButton) {
        let vc = ViewController.fromStoryboard()
        vc.shouldFixPredicateEditor = false
        self.presentAsSheet(vc)
    }
    
    @IBAction func presentFixedSheet(sender: NSButton) {
        let vc = ViewController.fromStoryboard()
        vc.shouldFixPredicateEditor = true
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
