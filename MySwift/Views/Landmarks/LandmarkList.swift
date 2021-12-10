//
//  LandmarkList.swift
//  MySwift
//
//  Created by origin on 2021/11/29.
//

import SwiftUI

struct LandmarkList: View {
    // The modelData property gets its value automatically, as long as the
    // environmentObject(_:) modifier has been applied to a parent.
    //
    // For this, it is the MySwiftApp.swift.
    @EnvironmentObject var modelData: ModelData
    
    // State is a value, or a set of values, that can change over time, and
    // that affects a view’s behavior, content, or layout.
    //
    // Because you use state properties to hold information that’s specific
    // to a view and its subviews, you always create state as private.
    @State private var showFavoritesOnly = false
    
    @State private var filter = FilterCategory.all
    @State private var selectedlandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var navigationTitle: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var selectedIndex: Int? {
        return modelData.landmarks.firstIndex(where: {$0.id == selectedlandmark?.id} )
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedlandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(navigationTitle)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Filter", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Landmark.")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[selectedIndex ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
