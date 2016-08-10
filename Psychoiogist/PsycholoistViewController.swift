//
//  ViewController.swift
//  Psychoiogist
//
//  Created by lwang on 16/8/4.
//  Copyright © 2016年 lwang. All rights reserved.
//

import UIKit

class PsycholoistViewController: UIViewController {
    
    
    
    @IBAction func nothing(sender: AnyObject) {
        performSegueWithIdentifier("nothing", sender:nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController{
            destination = navCon.visibleViewController
        }
        
        if  let hvc = destination as? DiagnosticHappinessViewController{
            if let identifer = segue.identifier{
                switch identifer {
                case "sad": hvc.happiness = 0
                case "happy": hvc.happiness = 100
                case "nothing":hvc.happiness = 70
                default: hvc.happiness = 50
                    
                }
            }
        }
        
    }
}

