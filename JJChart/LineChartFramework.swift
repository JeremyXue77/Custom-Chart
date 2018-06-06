//
//  LineChartFramework.swift
//  JJChart
//
//  Created by JeremyXue on 2018/6/3.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit
import Foundation

public class CustomLineChart: UIView {
    
    //  x , y Position
    private var xPosition:CGFloat = 0
    private lazy var yPosition:CGFloat = self.frame.maxY
    
    private var linePath = UIBezierPath()
    private var lineShapeLayer = CAShapeLayer()
    
    // MARK: - Objects
    private var chartScrollView:UIScrollView!
    private var chartView:UIView!
    
    public func loadView() {
        
        
        // Create chart scroll view & chart view
        chartView = UIView(frame: self.frame)
        chartView.backgroundColor = UIColor.clear
        chartView.center = self.center
        
        linePath.move(to: CGPoint(x: 0, y: chartView.frame.maxY))
        
        chartScrollView = UIScrollView(frame: self.frame)
        chartScrollView.center = self.center
        chartScrollView.backgroundColor = UIColor.black
        chartScrollView.contentSize = chartView.frame.size
        chartScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        chartScrollView.addSubview(chartView)
        self.addSubview(chartScrollView)
        
        SettingLabel(viewHeight: Int(chartView.frame.height))
        // Do any additional setup after loading the view.
    }
    
    
    public func SettingChartPoint(yPositionArray:[CGFloat]) {
        for y in yPositionArray {
            xPosition += 100
            self.yPosition = y
            updateChart()
        }
    }
    
    private func SettingLabel(viewHeight:Int) {

        for height in 0...viewHeight {
            if height % 100 == 0 {
                let yScaleLabel = UILabel()
                yScaleLabel.frame = CGRect(x: 20, y: (viewHeight - height) - 20, width: 40, height: 30)
                yScaleLabel.text = "\(height)"
                yScaleLabel.textColor = UIColor.green
                
                self.addSubview(yScaleLabel)
            }
        }
        
    }
    
    
    // MARK: - LineChart functions
    
    private func updateChart() {
        updateChartViewFrame()
        linePath.addLine(to: CGPoint(x: xPosition, y: yPosition))
        lineShapeLayer.path = linePath.cgPath
        lineShapeLayer.fillColor = UIColor.clear.cgColor
        lineShapeLayer.strokeColor = UIColor.green.cgColor
        lineShapeLayer.lineWidth = 1
        
        chartView.layer.addSublayer(lineShapeLayer)
        markPoint()
    }
    
    private func markPoint() {
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
        xScaleLabel.center = CGPoint(x: xPosition + 50 , y: self.frame.maxY - 20)
        xScaleLabel.text = "\(Int(xPosition))"
        xScaleLabel.textColor = UIColor.green
        
        chartView.addSubview(xScaleLabel)
        chartView.addSubview(coordinateLabel)
        chartView.addSubview(circlePoint)
    }
    
    private func updateChartViewFrame() {
        if xPosition >= chartView.frame.maxX {
            chartView.frame = CGRect(x: 0, y: 0, width: xPosition + 50, height: chartView.frame.height)
            chartScrollView.contentSize = chartView.bounds.size
        }
    }
    
    
    
}
