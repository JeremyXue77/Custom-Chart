//
//  LineChartViewController.swift
//  JJChart
//
//  Created by JeremyXue on 2018/5/30.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class LineChartViewController: UIViewController {
    
    //  x , y Position
    var xPosition:CGFloat = 0
    lazy var yPosition:CGFloat = self.view.frame.maxY
    
    let linePath = UIBezierPath()
    let lineShapeLayer = CAShapeLayer()
    
    // MARK: - Objects
    var chartScrollView:UIScrollView!
    var chartView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linePath.move(to: CGPoint(x: xPosition, y: yPosition))
        
        // Create chart scroll view & chart view
        chartView = UIView(frame: view.frame)
        chartView.backgroundColor = UIColor.clear
        
        chartScrollView = UIScrollView(frame: view.frame)
        chartScrollView.backgroundColor = UIColor.black
        chartScrollView.contentSize = chartView.frame.size
        chartScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        chartScrollView.addSubview(chartView)
        view.addSubview(chartScrollView)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        markPoint()
        let randomRange = UInt32(self.chartView.frame.height)
        for _ in 0...100 {
            xPosition += 100
            yPosition = CGFloat(arc4random() % randomRange)
            updateChart()
        }
        
        let viewHeight = Int(chartView.frame.height)
        
        for height in 0...viewHeight {
            if height % 100 == 0 {
                let yScaleLabel = UILabel()
                yScaleLabel.frame = CGRect(x: 20, y: (viewHeight - height) - 20, width: 40, height: 30)
                yScaleLabel.text = "\(height)"
                yScaleLabel.textColor = UIColor.green

                self.view.addSubview(yScaleLabel)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - LineChart functions
    
    func updateChart() {
        updateChartViewFrame()
        linePath.addLine(to: CGPoint(x: xPosition, y: yPosition))
        lineShapeLayer.path = linePath.cgPath
        lineShapeLayer.fillColor = UIColor.clear.cgColor
        lineShapeLayer.strokeColor = UIColor.green.cgColor
        lineShapeLayer.lineWidth = 1
        
        chartView.layer.addSublayer(lineShapeLayer)
        markPoint()
    }
    
    func markPoint() {
        let circlePoint = UIView()
        circlePoint.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        circlePoint.layer.cornerRadius = circlePoint.frame.height / 2
        circlePoint.clipsToBounds = true
        circlePoint.center = CGPoint(x: xPosition, y: yPosition)
        circlePoint.backgroundColor = UIColor.green
        
        let coordinateLabel = UILabel()
        coordinateLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        coordinateLabel.text = "(\(Int(xPosition)),\(Int(chartView.frame.height - yPosition)))"
        coordinateLabel.center = CGPoint(x: xPosition, y: yPosition - 20)
        coordinateLabel.textColor = UIColor.green
        
        let xScaleLabel = UILabel()
        xScaleLabel.frame = CGRect(x: 0, y: 0 , width: 100, height: 20)
        xScaleLabel.center = CGPoint(x: xPosition + 50 , y: view.frame.maxY - 20)
        xScaleLabel.text = "\(Int(xPosition))"
        xScaleLabel.textColor = UIColor.green
        
        chartView.addSubview(xScaleLabel)
        chartView.addSubview(coordinateLabel)
        chartView.addSubview(circlePoint)
    }
    
    func updateChartViewFrame() {
        if xPosition >= chartView.frame.maxX {
            chartView.frame = CGRect(x: 0, y: 0, width: xPosition + 50, height: chartView.frame.height)
            chartScrollView.contentSize = chartView.frame.size
        }
    }
    
    

}
