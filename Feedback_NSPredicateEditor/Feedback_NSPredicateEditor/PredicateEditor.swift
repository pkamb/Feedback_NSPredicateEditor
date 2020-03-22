//
//  PredicateEditor.swift
//  Feedback_NSPredicateEditor
//
//  Created by Peter Kamb on 3/22/20.
//  Copyright © 2020 Feedback. All rights reserved.
//

import Cocoa

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
