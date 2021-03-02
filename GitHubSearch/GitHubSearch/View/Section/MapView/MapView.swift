//
//  MapView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/25.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MapView: View {
    let places = [
        Place(name: "cafe-1", latitude: 51.519581, longitude: -0.127002),
        Place(name: "cafe-2", latitude: 51.508052, longitude: -0.076035),
        Place(name: "cafe-3", latitude: 51.500710, longitude: -0.124617),
        Place(name: "cafe-4", latitude: 51.400710, longitude: -0.124617),
        Place(name: "cafe-5", latitude: 51.530010, longitude: -0.121417),
        Place(name: "cafe-6", latitude: 51.470110, longitude: -0.125317),
        Place(name: "cafe-7", latitude: 52.350510, longitude: -0.122217),
        Place(name: "cafe-8", latitude: 51.480910, longitude: -0.127117),
        Place(name: "cafe-9", latitude: 54.440610, longitude: -0.128017),
        Place(name: "cafe-10", latitude: 51.560310, longitude: -0.125917)
    ]
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.514134, longitude: -0.104236),
        span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
  
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                DrawView(image: "\(place.name)")
                    .frame(width: 80, height: 80)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
