//
//  DayMetricVC.swift
//  Dindr
//
//  Created by lsecrease on 1/23/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import SwiftChart
 


class DayMetricVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var months: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
       
        
       
         let cell = tableView.dequeueReusableCellWithIdentifier("DayCell", forIndexPath: indexPath) as! DayMetricTableViewCell
       
        //cell.delegate = self
        let data = [(x: 0, y: 0), (x: 0.5, y: 3.1), (x: 1.2, y: 2), (x: 2.1, y: 4.2), (x: 2.6, y: 1.1)]
        let series = ChartSeries(data: data)
        series.color = ChartColors.redColor()
        series.area = true
        cell.chart.highlightLineColor = ChartColors.blueColor()
        cell.chart.highlightLineWidth = 1.5
        cell.chart.areaAlphaComponent = 5.0
        cell.chart.addSeries(series)
        
        return cell
    }

}

//extension DayMetricVC : ChartShowDelegate {
//    
//    func showChart(chart: Chart) {
//        
//    }
//    
//}



