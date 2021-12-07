//
//  ContentView.swift
//  MyWatchSwift WatchKit Extension
//
//  Created by origin on 2021/12/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
