//
//  DetailedWorkoutViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class DetailedWorkoutViewController: UIViewController {
    
    var workout: Workout?
    
   

    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var workoutTypeLabel: UILabel!
    
    
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let w = workout {
            dateLabel.text = w.date
            workoutTypeLabel.text = w.type
            shortDescriptionLabel.text = w.shortDescription
            notesLabel.text = w.notes
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
