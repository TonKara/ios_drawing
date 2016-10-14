//
//  DrawView.swift
//  Drawing
//
//  Created by とん航 on 7/12/16.
//  Copyright © 2016 とん航. All rights reserved.
//

//import Cocoa
import UIKit

class DrawView: UIView {
    //Line.swiftのクラスであるLineをここで使用
    var lines: [Line] = []
    var lastPoint: CGPoint!
    
    
    required init(coder aDecoder: (NSCoder!)){
        super.init(coder: aDecoder)!
    }
    //initは必要っぽい。初期画面の色とか変えられる。aDecoderとかは意味不明だが言われるがままにやった
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //lastPoint = touches.anyObject()?.locationInView(self) //古いバージョンではこれで座標取得
        if let touch = touches.first{
            lastPoint = touch.locationInView(self)//gets the point where i touched
        
        //let touch = touches.first!
        //lastPoint = touch.locationInView(self)    //こっちでもよい。
    }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        var newPoint = touch.locationInView(self)
        
        lines.append(Line(start: lastPoint, end: newPoint))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
        //更新を反映
        }
 
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines{
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetLineCap(context,CGLineCap.Round)
        CGContextSetRGBStrokeColor(context,1,0,0,1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    
        }
    }
