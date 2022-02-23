//
//  WorkoutDetailsView.swift
//  HabitTracking
//
//  Created by Chris Peloso on 2/23/22.
//

import SwiftUI

struct WorkoutDetailsView: View {
    
    let workout: Workout
    let exercise: Exercise
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 15) {
                Image(exercise.image)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                
                Text("**Description:** \(exercise.description)")

                Text("**Sets:** \(workout.sets.count)")
                
                ForEach(0..<workout.sets.count) { i in
                    Text("\(workout.sets[i].reps) reps @ \(workout.sets[i].weightFormatted) lbs")
                }
            }
            .padding(.horizontal, 15)
            
            
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    
    static let workout: Workout = Workout(name: "Chin Ups", sets: [Workout.Set(reps: 15, weight: 55), Workout.Set(reps: 15, weight: 55)])
    
    static let exercise: Exercise = Exercise(name: "Chin Ups", description: "This is a chin up workout", image: "Chin Up")
    
    static var previews: some View {
        WorkoutDetailsView(workout: workout, exercise: exercise)
    }
}
