//
//  LandmarkList.swift
//  MyWatchSwift WatchKit Extension
//
//  Created by origin on 2021/12/9.
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
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
