//
//  ShowPhotoMetaDataView.swift
//  PhotoTrack
//
//  Created by Christopher Alford on 15.12.20.
//

import SwiftUI
import PhotosUI

struct ShowPhotoMetaDataView: View {
    @State var showSheet = false
    @State var selectedImage: UIImage?
    @State var date: Date?
    @State var location: CLLocationCoordinate2D?

    var formatter: DateFormatter

    init() {
        formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
    }

    var body: some View {
        VStack {
            Button("Select Image!") {
                showSheet.toggle()
            }
            .padding()
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            if let date = date {
                Text("Taken:")
                Text(formatter.string(from: date))
            }
            if let location = location {
                Text("Location:")
                let latd = location.latitude >= 0 ? "N" : "S"
                let lngd = location.longitude >= 0 ? "E" : "W"
                Text("latitude: \(location.latitude.ddString()) \(latd)")
                Text("longitude: \(location.longitude.ddString()) \(lngd)")
            }
        }.sheet(isPresented: $showSheet) {
            CustomPhotoPickerView(selectedImage: $selectedImage, date: $date, location: $location)
        }
    }
}

struct ShowPhotoMetaDataView_Previews: PreviewProvider {
    static var previews: some View {
        ShowPhotoMetaDataView()
    }
}
