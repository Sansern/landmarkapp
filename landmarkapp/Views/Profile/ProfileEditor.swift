//
//  ProfileEditor.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/18/21.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
 
    //Set Date Range
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        return min...max
    }
    
    
    var body: some View {
        List {
            VStack() {
                HStack {
                    Text("Username")
                        .bold()
                    Divider()
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $profile.username)
                }
                .padding(.vertical,8.0)
                
                
                Toggle(isOn: $profile.preferNotifications) {
                    Text("Enable Notifications")
                        .bold()
                }
                .padding(.vertical,8.0)
                
                VStack(alignment: .leading) {
                    Text("Seasonal Photo")
                        .bold()
                    Picker("Seasonal Photo",selection: $profile.seasonalPhoto) {
                            ForEach(Profile.Season.allCases) { season in
                                Text(season.rawValue).tag(season)
                            }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.vertical,8.0)
                
               
                DatePicker(selection: $profile.goalDate,in: dateRange, displayedComponents: .date) { Text("Goal Date").bold()
                }
                .pickerStyle(.wheel)
                .padding(.vertical, 8.0)
                
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
