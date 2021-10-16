//
//  Profile.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/17/21.
//

import Foundation

struct Profile {
    var username: String
    var preferNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kimar")
                                    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autum = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
    
}
