//
//  TextViewController.swift
//  Psychoiogist
//
//  Created by lwang on 16/8/5.
//  Copyright © 2016年 lwang. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!{
        didSet{
             textView.text = text
        }
        
    }
    var text:String? = ""{
        didSet{
            textView?.text = text
        }
    }


}
