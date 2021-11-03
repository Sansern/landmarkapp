//
//  LandmarkList.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/14/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        // All
        case all = "All"
        // Lakes
        case lakes = "Lakes"
        // Rivers
        case riveres = "Rivers"
        // Moutains
        case mountains = "Mountains"
        
        var id: FilterCategory {self}
    }
    
//    Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
            let title = filter == .all ? "Landmarks" : filter.rawValue
            return showFavoritesOnly ? "Favorite \(title)" : title
        }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                        #if !os(macOS)
                            .padding(.vertical, 8.0)
                        #endif
                    }
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $showFavoritesOnly) {
                                                    Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkList()
                .environmentObject(ModelData())
        }
    }
}
