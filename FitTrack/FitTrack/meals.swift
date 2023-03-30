//
//  meals.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import Foundation

var meals = [Meal]()

var totalCalories = 0


class Meal {
    
    var foodName: String
    var calories: String
    
    init(foodName: String, calories: String) {
        self.foodName = foodName
        self.calories = calories
    }
    
}
