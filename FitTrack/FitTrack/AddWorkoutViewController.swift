//
//  AddWorkoutViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class AddWorkoutViewController: UIViewController {
    
    @IBOutlet weak var workoutType: UISegmentedControl!
    
    @IBOutlet weak var shortSummaryInput: UITextField!
    @IBOutlet weak var notesInput: UITextView!
    
    public var info: ((String, String, String) -> Void)?
    
    var typeOfWorkout = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeOfWorkout = workoutType.titleForSegment(at: 0)!
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(SavePressed))
        
    }
    
    @IBAction func SavePressed() {
        guard let shortSummary = shortSummaryInput.text, !shortSummary.isEmpty,
                  let notesText = notesInput.text, !notesText.isEmpty else {
                // Display an alert message to the user indicating that some fields are empty
                let alert = UIAlertController(title: "Missing Fields", message: "Please fill in all required fields.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return
            }
            
        info?(typeOfWorkout, notesText, shortSummary)
        
    }
    
    @IBAction func typeOfWorkout(_ sender: UISegmentedControl) {
        typeOfWorkout = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
    }
    
    /*
    // MARK: - Navigation
Voif
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
