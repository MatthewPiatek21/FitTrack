//
//  workouts.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import Foundation

//var workouts = [Workout]()

var workouts = [Workout(type:"Leg", shortDescription:"Tought leg day. Did 14 sets", notes:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet odio risus. Proin fringilla sapien leo, quis interdum diam elementum vitae. Etiam scelerisque risus et metus mollis auctor. Donec accumsan magna ut felis ullamcorper tristique. Aliquam ac odio sapien. Integer suscipit volutpat purus ut pellentesque. Maecenas accumsan enim eget mi gravida, ut scelerisque nisi viverra. Aliquam efficitur leo quam, nec semper neque auctor id.", date:"02/25/23"),Workout(type:"Arm", shortDescription:"Tought arm day. Did 50 curls", notes:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet odio risus. Proin fringilla sapien leo, quis interdum diam elementum vitae. Etiam scelerisque risus et metus mollis auctor. Donec accumsan magna ut felis ullamcorper tristique. Aliquam ac odio sapien. Integer suscipit volutpat purus ut pellentesque. Maecenas accumsan enim eget mi gravida, ut scelerisque nisi viverra. Aliquam efficitur leo quam, nec semper neque auctor id.", date:"02/20/23"),Workout(type:"Cardio", shortDescription:"Tought Cardio day. Ran 5 miles", notes:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet odio risus. Proin fringilla sapien leo, quis interdum diam elementum vitae. Etiam scelerisque risus et metus mollis auctor. Donec accumsan magna ut felis ullamcorper tristique. Aliquam ac odio sapien. Integer suscipit volutpat purus ut pellentesque. Maecenas accumsan enim eget mi gravida, ut scelerisque nisi viverra. Aliquam efficitur leo quam, nec semper neque auctor id.", date:"02/15/23")]

var weights : [Double] = [155,160,162,165,160,161,150,140,145]

class Workout {
    
    var type: String
    var shortDescription: String
    var notes: String
    var date: String
    
    
    init(type: String, shortDescription: String, notes: String, date: String) {
        self.type = type
        self.shortDescription = shortDescription
        self.notes = notes
        self.date = date
    }
    
    
    
  
}
