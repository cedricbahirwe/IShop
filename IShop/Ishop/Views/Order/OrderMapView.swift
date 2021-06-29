//
//  OrderMapView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI
import MapKit


struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct OrderMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -1.939547,
                                       longitude: 30.074418),
        span: MKCoordinateSpan(latitudeDelta: 0.001,
                               longitudeDelta: 0.001))
    private let annotation = AnnotatedItem(
        name: "John Doe",
        coordinate: CLLocationCoordinate2D(latitude: -1.939547,
                                           longitude: 30.074418))
    
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow), annotationItems: [annotation]) { item in
                
                MapAnnotation(coordinate: item.coordinate) {
                    VStack(spacing: 4) {
                        Image("cedric")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 40, height: 40)
                        Text(item.name)
                            .font(Font.caption.bold())

                    }
                }
                
            }
            .ignoresSafeArea(.all, edges: .all)
            
            VStack(alignment: .leading) {
                Button("Close"){
                    presentationMode.wrappedValue.dismiss()
                    
                }
                .foregroundColor(.primary)
                .padding()
                
                Spacer()
                VStack {
                    HStack {
                        Color.lightGray
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        VStack(alignment: .leading) {
                            Text("John Doe")
                            Text("Will arrive in about 25 minutes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    LargeBlackButton("Contact your driver", action: {})
                }
                .padding()
                .background(Color.mainBackground)
                .ignoresSafeArea(.all, edges: .bottom)
                
            }
            
        }
    }
}

struct OrderMapView_Previews: PreviewProvider {
    static var previews: some View {
        OrderMapView()
    }
}
