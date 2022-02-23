//
//  Workout.swift
//  HabitTracking
//
//  Created by Chris Peloso on 2/23/22.
//

import Foundation

struct Workout: Codable {
    
    struct Set: Codable {
               
        let reps: Int
        let weight: Double
        
        var weightFormatted: String{
            return String(format: "%.2f", weight)
        }
    }
    
    let name: String
    
    let sets: [Set]
    
}
