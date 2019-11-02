//
//  CanvasView.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/29/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class CanvasView: UIView {
        func undo() {
            _ = lines.popLast()
            setNeedsDisplay()
        }
        func clear() {
            lines.removeAll()
            setNeedsDisplay()
        }
        override func layoutSubviews() {
            self.clipsToBounds = true
            self.isMultipleTouchEnabled = false
            self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "writingGuideline.png"))
        }
        fileprivate var lines = [[CGPoint]]()
        override func draw( _ rect: CGRect){
            super.draw(rect)
            guard let context = UIGraphicsGetCurrentContext() else{return}
            
            context.setLineWidth(5)
            
            lines.forEach{ (line) in
                for (i,p) in line.enumerated(){
                    if i == 0{
                        context.move(to:p)
                    }
                    else{
                        context.addLine(to: p)
                    }
                }
            }
            
            context.strokePath()
        }
        
        //var line = [CGPoint]()
        
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            lines.append([CGPoint]())
        }
        
        override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
            guard let point = touches.first?.location(in:nil)else {return}
            guard var lastLine = lines.popLast() else{return}
            lastLine.append(point)
            lines.append(lastLine)
            
            //lines.append(point)
            setNeedsDisplay()
        }
    }



