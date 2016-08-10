//
//  HappinessViewController.swift
//  Happiness
//
//  Created by lwang on 16/8/2.
//  Copyright © 2016年 lwang. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    @IBAction func chenge(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation  = gesture.translationInView(faceView)
            let HappinessChanged = -Int(translation.y/Constants.HappinessChangeScale)
            if HappinessChanged != 0{
                happiness+=HappinessChanged
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    @IBOutlet weak var faceView: FaceView!{
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.scale)))
//            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.chengeHappiness)))
        }
    }
    var happiness:Int = 100{ // 0 = very sad 100 = ecstatic
        didSet{
            happiness = min(max(happiness, 0), 100)
            print(happiness)
            updateUI()
        }
    }
    
//    @IBAction func changehappiness(gesture: UIPanGestureRecognizer) {
//        func chengeHappiness(gesture:UIPanGestureRecognizer) {
//            switch gesture.state {
//            case .Ended: fallthrough
//            case .Changed:
//                let translation  = gesture.translationInView(faceView)
//                let HappinessChanged = -Int(translation.y/Constants.HappinessChangeScale)
//                if HappinessChanged != 0{
//                    happiness+=HappinessChanged
//                    gesture.setTranslation(CGPointZero, inView: faceView)
//                }
//            default: break
//            }
//        }
//    }
    
    private struct Constants{
        static let HappinessChangeScale:CGFloat = 4
    }
    
    func chengeHappiness(gesture:UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation  = gesture.translationInView(faceView)
            let HappinessChanged = -Int(translation.y/Constants.HappinessChangeScale)
            if HappinessChanged != 0{
                happiness+=HappinessChanged
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
        
    }
    
    func updateUI()  {
        faceView?.setNeedsDisplay()
        title = String(happiness)
    }
    
    func smiliness(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
    
}
