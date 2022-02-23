//
//  ExerciseDetailsView.swift
//  HabitTracking
//
//  Created by Chris Peloso on 2/22/22.
//

import SwiftUI

struct ExerciseDetailsView: View {
    
    //  these values are set in the initializer for the view
    let exercise: Exercise
    let sets: [Exercise.Set]
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 15) {
                Image(exercise.image)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                
                Text("**Description:** \(exercise.description)")

                Text("**Sets:** \(exercise.sets.count)")
                
                ForEach(0..<sets.count) { i in
                    Text("\(sets[i].reps) reps @ \(sets[i].weightFormatted) lbs")
                }
            }
            .padding(.horizontal, 15)
            
            
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(exercise: Exercise, sets: [Exercise.Set]){
        self.exercise = exercise
        
        self.sets = sets
        
    }
}

struct ExerciseDetailsView_Previews: PreviewProvider {
    
    static let sets = [Exercise.Set(reps: 15, weight: 55), Exercise.Set(reps: 15, weight: 55)]
    
    static let exercise: Exercise = Exercise(name: "Chin Up", description: "this is a test description. ajsdkfsdjf", image: "Chin Up", sets: sets)
    
    static var previews: some View {
        ExerciseDetailsView(exercise: exercise, sets: sets)
    }
}
