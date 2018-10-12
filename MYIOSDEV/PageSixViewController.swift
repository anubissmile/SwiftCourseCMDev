//
//  PageSixViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import Charts

class PageSixViewController: UIViewController {
    
    @IBOutlet weak var mLineChart: LineChartView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Draw line chart
        self.drawLineChart()
    }
    
    func drawLineChart(){
        // Main
        self.mLineChart.noDataText = "You need to provide data for the chart.";
        self.mLineChart.chartDescription?.text = "www.codemobiles.com"
        self.mLineChart.chartDescription?.font = UIFont.boldSystemFont(ofSize: 15)
        self.mLineChart.chartDescription?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
        self.mLineChart.backgroundColor = UIColor.clear
        self.mLineChart.dropShadow()
        self.mLineChart.gridBackgroundColor = UIColor.clear
        self.mLineChart.legend.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.mLineChart.setExtraOffsets(left: 0, top: 0, right: 30, bottom: 0)
        
        // Bottom
        self.mLineChart.xAxis.labelPosition = .bottom
        self.mLineChart.xAxis.labelTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.mLineChart.xAxis.gridColor =  #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 0.1)
        
        // Left
        self.mLineChart.leftAxis.enabled = true;
        self.mLineChart.leftAxis.labelTextColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.mLineChart.leftAxis.gridColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        // Right
        self.mLineChart.rightAxis.enabled = false;
        
        // dummy data
        let rawData = [18500.0, 18550.0, 18650.0, 18650.0, 17642.0]
        var dataEntry: [ChartDataEntry] = []
        for i in 0...3 {
            dataEntry.append(ChartDataEntry(x: Double(i) , y: rawData[i]))
        }
        
        // dataset
        let chartDataSet = LineChartDataSet(values: dataEntry, label: "GOLD")
        chartDataSet.lineWidth = 4
        chartDataSet.mode = .linear
        chartDataSet.colors = [#colorLiteral(red: 0.2470588235, green: 0.7058823529, blue: 0.9882352941, alpha: 1)]
        chartDataSet.valueFont = UIFont.boldSystemFont(ofSize: 14)
        chartDataSet.valueFormatter = ValueFormatter()
        chartDataSet.valueColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        chartDataSet.circleRadius = 10
        chartDataSet.setCircleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.2039215686, alpha: 1))
        chartDataSet.circleHoleRadius = 7
        chartDataSet.circleHoleColor = #colorLiteral(red: 0.2470588235, green: 0.7058823529, blue: 0.9882352941, alpha: 1)
        //chartDataSet.drawFilledEnabled = true
        //chartDataSet.fillColor = UIColor(hexString: "#6D95E8")
        //chartDataSet.fillAlpha = 0.3
        
        let chartView = LineChartData()
        chartView.addDataSet(chartDataSet)
        
        self.mLineChart.data = chartView
    }
    
    @objc(ValueFormatter)
    private class ValueFormatter: NSObject, IValueFormatter{
        
        public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
            return "\(value) Pt.";
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
