//
//  ProgressViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit
import Charts


class ProgressViewController: UIViewController {
    
    
    @IBOutlet weak var weightInput: UITextField!
    
    
    @IBOutlet weak var lineChart: LineChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGraph()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitWeight(_ sender: Any) {
        let input = Double(weightInput.text!)
        if input != nil {
            weights.append(input!)
            updateGraph()
        }
        else {
            let alert = UIAlertController(title: "Missing Fields", message: "Please fill in all required fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        
    }
    
    func updateGraph(){
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<weights.count {
            let value = ChartDataEntry(x: Double(i) , y: weights[i])
            lineChartEntry.append(value)
        }
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Weight") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue

        let data = LineChartData()//This is the object that will be added to the chart
        //data.addDataSet(line1) //Adds the line to the dataSet
        data.append(line1)
        lineChart.data = data //finally - it adds the chart data to the chart and causes an update
        lineChart.chartDescription.text = "Weight"
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
