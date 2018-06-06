////
////  ViewController.swift
////  JJChart
////
////  Created by JeremyXue on 2018/5/30.
////  Copyright © 2018年 JeremyXue. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    @IBOutlet weak var myLineChart: CustomLineChart!
//    
//    override func viewWillAppear(_ animated: Bool) {
//        
//        let lineChart = CustomLineChart()
//        lineChart.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        self.view.addSubview(lineChart)
//
//        lineChart.loadView()
//        lineChart.SettingChartPoint(yPositionArray: [300,200,100])
//        
//        let pieChart = CustomPieChart()
//        pieChart.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        
//        self.view.addSubview(pieChart)
//        
//        pieChart.Setting(radius: 100, percentArray: [20,30,50])
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//}
//
