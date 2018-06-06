//
//  PieChartViewController.swift
//  JJChart
//
//  Created by JeremyXue on 2018/5/30.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
    
    var total:Double = 0
    var start:CGFloat = 0
    var numberArray = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...5 {
            let number = Double(arc4random() % 10) + 1
            numberArray.append(number)
        }
        
        for number in numberArray {
            total += number
            print("Number\(number)")
        }
        
        print(total)
        
        for i in 0...numberArray.count - 1 {
            let randomColor = UIColor.randomColor
            pieChart(radius: 200, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / total * numberArray[i]) , color: randomColor.cgColor)
            start += CGFloat(2 * Double.pi / total * numberArray[i])
            
            showColorPercent(centerX: 30, centerY: 30 * (i + 1), color: randomColor, i : i)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pieChart(radius:CGFloat,startAngle:CGFloat,endAngle:CGFloat,color:CGColor) {
        print(startAngle, endAngle)
        let path = UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: view.center)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color
        self.view.layer.addSublayer(layer)
    }
    
    func showColorPercent(centerX x:Int,centerY y:Int,color:UIColor,i:Int) {
        let colorLabel = UILabel()
        colorLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        colorLabel.center = CGPoint(x: x, y: y)
        colorLabel.backgroundColor = color
        colorLabel.textAlignment = NSTextAlignment.center
        colorLabel.text = "\(Int(numberArray[i] / total * 100))%"
        view.addSubview(colorLabel)
    }
    
}

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
