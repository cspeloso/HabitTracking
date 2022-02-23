//
//  Exercise.swift
//  HabitTracking
//
//  Created by Chris Peloso on 2/23/22.
//

import Foundation

struct Exercise: Codable {
    
    let name: String
    let description: String
    let image: String
    
    
    //  computed property
    var shortDescription: String {
        
        var shortDesc = description.trimmingCharacters(in: ["\n"])
        
        if(shortDesc.count > 40) {
            shortDesc = shortDesc.substring(with: 0..<40) + "..."
        }
        
        return shortDesc
    }
}
