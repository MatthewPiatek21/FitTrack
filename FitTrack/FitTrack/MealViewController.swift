//
//  MealViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Meal"
        updateTotalCalories()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func newMealTapped(_ sender: Any) {
        guard let view = storyboard?.instantiateViewController(identifier: "addMeal") as? addMealViewController else {
            return
        }
        view.title = "New Note"
        view.navigationItem.largeTitleDisplayMode = .never
        view.info = { foodname, calories in
            self.navigationController?.popToRootViewController(animated: true)
            meals.append(Meal(foodName: foodname, calories: calories))
            self.table.isHidden = false
            totalCalories += Int(calories)!
            self.table.reloadData()
        }
        navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.foodName
        cell.detailTextLabel?.text = "Calories: " + meal.calories
        return cell
    }
    
    func updateTotalCalories(){
        totalCaloriesLabel.text = String(totalCalories)
    }
        
    
    @IBAction func resetPressed(_ sender: Any) {
        meals = [Meal]()
        table.reloadData()
        totalCalories = 0
        updateTotalCalories()
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
