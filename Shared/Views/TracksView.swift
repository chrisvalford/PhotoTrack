//
//  TracksView.swift
//  PhotoTrack
//
//  Created by Christopher Alford on 15.12.20.
//

import SwiftUI
import CoreData

struct TracksView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Track>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TracksView_Previews: PreviewProvider {
    static var previews: some View {
        TracksView()
    }
}
