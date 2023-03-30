//
//  addMealViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class addMealViewController: UIViewController {
    
    @IBOutlet weak var foodEntry: UITextField!
    @IBOutlet weak var foodEnter: UIButton!
    
    @IBOutlet weak var proteinEntry: UITextField!
    @IBOutlet weak var carbsEntry: UITextField!
    @IBOutlet weak var fatEntry: UITextField!
    
    @IBOutlet weak var customFood: UILabel!
    
    @IBOutlet weak var calories: UILabel!
    
    @IBOutlet weak var saveFood: UIButton!
    
    @IBOutlet weak var calculateCalories: UIButton!
    
    public var info: ((String, String) -> Void)?
    
    var totalCalories = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveFoodTapped))
    }

    @IBAction func foodEnterTapped(_ sender: UIButton) {
        customFood.text = foodEntry.text
    }
    
    
    @IBAction func calculateCaloriesButtonTapped(_ sender: UIButton) {
        let proteinValue = Int(proteinEntry.text ?? "0") ?? 0
        let carbsValue = Int(carbsEntry.text ?? "0") ?? 0
        let fatValue = Int(fatEntry.text ?? "0") ?? 0
        
        totalCalories = (proteinValue * 4) + (carbsValue * 4) + (fatValue * 9)
        calories.text = "Calories: \(totalCalories)"
    }
 
    @IBAction func saveFoodTapped() {
        guard let foodName = foodEntry.text, !foodName.isEmpty else { return }
        let proteinValue = Int(proteinEntry.text ?? "0") ?? 0
        let carbsValue = Int(carbsEntry.text ?? "0") ?? 0
        let fatValue = Int(fatEntry.text ?? "0") ?? 0
        
        info?(foodName,String(totalCalories))
        
        
        foodEntry.text = ""
        proteinEntry.text = ""
        carbsEntry.text = ""
        fatEntry.text = ""
        
        customFood.text = "Enter Food"
        calories.text = "Calories"
        
        

    }
}
