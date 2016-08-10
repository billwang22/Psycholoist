//
//  DiagnosticHappinessViewController.swift
//  Psychoiogist
//
//  Created by lwang on 16/8/5.
//  Copyright © 2016年 lwang. All rights reserved.
//

import UIKit

class DiagnosticHappinessViewController: HappinessViewController,UIPopoverPresentationControllerDelegate {
    
    
    override var happiness: Int{
        didSet{
            diagnosticHistory += [happiness]
        }
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory:[Int]{
        get{
            return defaults.objectForKey(History.DefaultKey) as? [Int] ?? []
        }
        set{
            defaults.setObject(newValue, forKey: History.DefaultKey)
        }
    }
    
    private struct History{
        static let SegueIdentifier = "history"
        static let DefaultKey = "Diagnostic history"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController{
                    if let ppc = tvc.popoverPresentationController{
                        ppc.delegate = self
                    }
                    tvc.text = diagnosticHistory.description
                }
                
            default:break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

}
