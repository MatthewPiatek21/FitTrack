//
//  MainViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/15/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var numberOfWorkoutsLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        numberOfWorkoutsLabel.text = String(workouts.count)
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        dateLabel.text = formatter.string(from: today)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "general", for: indexPath)
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.type
        cell.detailTextLabel?.text = workout.date
        return cell
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return workouts.count
        }
    
    @IBAction func addWorkoutPressed(_ sender: Any) {
        guard let view = storyboard?.instantiateViewController(identifier: "newworkout") as? AddWorkoutViewController else {
            return
        }
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let curDate = dateFormatter.string(from: date)
        view.info = { typeOfWorkout, notesText, shortSummary in
            self.navigationController?.popToRootViewController(animated: true)
            workouts.insert((Workout(type: typeOfWorkout, shortDescription: shortSummary, notes: notesText, date: curDate)), at: 0)
            print("Workout Apended")
            self.tableView.reloadData()
            self.numberOfWorkoutsLabel.text = String(workouts.count)
        }
        navigationController?.pushViewController(view, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            workouts.remove(at: indexPath.row)
            numberOfWorkoutsLabel.text = String(Int(numberOfWorkoutsLabel.text!)! - 1)
            tableView.deleteRows(at: [indexPath], with: .fade)
         
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailedWorkoutViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow {
               detailViewController.workout = workouts[indexPath.row]
           }
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
