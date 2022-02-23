//
//  ContentView.swift
//  HabitTracking
//
//  Created by Chris Peloso on 2/22/22.
//

import SwiftUI



struct ContentView: View {
    
    let exercises: [Exercise] = Bundle.main.decode("exercises.json")

    let workouts: [Workout] = Bundle.main.decode("UserExercises.json")
    
//    @State private var exercises: [Exercise] = [
//        Exercise(name: "Chin Up", description: "Chin ups. Used the lat pulldown machine instead because we probably couldn't actually do pull ups lol.", sets: 3, reps: 15, weight: 55),
//        Exercise(name: "Bench Press", sets: 3, reps: 8, weight: 65),
//        Exercise(name: "Split Squat", sets: 3, reps: 10, weight: 15),
//        Exercise(name: "Front Raise", sets: 3, reps: 15, weight: 12.5),
//        Exercise(name: "Bicep Curl", sets: 3, reps: 12, weight: 15)
//
//    ]
    
    var body: some View {
        
        TabView {
            Text("Favorites")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            Text("Friends")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Friends")
                }

            //  Personal Workouts
            NavigationView{
                VStack {
                    List {
                        ForEach(0..<workouts.count) { i in
                            
                            let workout: Workout = workouts[i]
                            let exercise: Exercise = exercises.first { $0.name == workout.name }!
                            
                            NavigationLink(destination: WorkoutDetailsView(workout: workout, exercise: exercise)){
                                Text(workout.name)
                            }                            
                        }
                    }
                }
                .navigationTitle("My Workouts")
            }
            .tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Workouts")
            }
            
            //  Exercises list
            NavigationView {
                VStack{
                    List {
                        ForEach(0..<exercises.count) { i in
                            let exercise = exercises[i]
                            
                            HStack {
                                
                                Text(exercise.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text(exercise.shortDescription)
                                    .font(.caption)
                                
                            }
                        }
                    }
                }
                .navigationTitle("Exercises")
            }
            .tabItem {
                Image(systemName: "list.bullet.circle")
                Text("Exercises")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
