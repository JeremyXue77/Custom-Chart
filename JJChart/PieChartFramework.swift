//
//  PieChartFramework.swift
//  JJChart
//
//  Created by JeremyXue on 2018/6/3.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit
import Foundation

public class CustomPieChart:UIView {
    
    private var total:Double = 0
    private var start:CGFloat = 0
    private var end:CGFloat = 0
    
    func Setting(radius:CGFloat ,percentArray:[Double]) {
        self.backgroundColor = UIColor.gray
        for number in percentArray {
            total += number
            print("Number\(number)")
        }
        
        print(total)
        
        for i in 0...percentArray.count - 1 {
            let randomColor = UIColor.randomColor
            pieChart(radius: radius, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / total * percentArray[i]) , color: randomColor.cgColor)
            start += CGFloat(2 * Double.pi / total * percentArray[i])
            
            showColorPercent(centerX: 30, centerY: 30 * (i + 1), color: randomColor,text:percentArray[i])
            
        }
    }
    
    private func pieChart(radius:CGFloat,startAngle:CGFloat,endAngle:CGFloat,color:CGColor) {
        print(startAngle, endAngle)
        let path = UIBezierPath(arcCenter: self.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: self.center)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color
        self.layer.addSublayer(layer)
    }
    
    private func showColorPercent(centerX x:Int,centerY y:Int,color:UIColor,text:Double) {
        let colorLabel = UILabel()
        colorLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        colorLabel.center = CGPoint(x: x, y: y)
        colorLabel.backgroundColor = color
        colorLabel.textAlignment = NSTextAlignment.center
        colorLabel.text = String(text)
        self.addSubview(colorLabel)
    }
}

// MARK: - Random Color

extension UIColor {
    
    open class var randomColor:UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255
            let green = CGFloat(arc4random() % 256) / 255
            let blue = CGFloat(arc4random() % 256) / 255
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
}
