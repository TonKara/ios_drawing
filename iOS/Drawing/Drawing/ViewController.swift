//
//  ViewController.swift
//  Drawing
//
//  Created by とん航 on 7/12/16.
//  Copyright © 2016 とん航. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet var drawview: DrawView //インスタンス？
    @IBOutlet var drawview: AnyObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearTapped(){//タップ後に呼ばれる関数
        
        let theDrawView: DrawView = drawview as! DrawView
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
        //空にする。
    }

}

