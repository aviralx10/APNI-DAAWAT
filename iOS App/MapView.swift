//
//  MapView.swift
//  MyTreat
//
//  Created by Aviral Yadav on 16/02/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var search: String = ""
    @Binding var show : Bool
    @Binding var disableMenu : Bool
    @State var showDetails = false
    @State var y: CGFloat = .zero
    @Binding var showCaptureImageView: Bool
    @State var details = Place(name: "Woodbox Cafe", rating: 4, description: "F15 A Delhi",  latitude: 28.693482552321843, longitude: 77.20464062997704 )
    let places = [
        Place(name: "Big Yellow Door", rating: 4, description: "2nd floor, 2521, Hudson Ln, Hudson Lane, GTB Nagar, Delhi, 110009", latitude: 28.68944 , longitude: 77.21442),
        Place(name: "Cafeteria & Co.", rating: 5, description: "Food bank • GGTB Nagar New Delhi, ",  latitude: 28.70894129040353, longitude: 77.18095054181947),
        Place(name: "The Salvation Army", rating: 4, description: "Hudson Ln,  GTB Nagar, Delhi", latitude: 28.696143680290433, longitude: 77.18150793652156),
        Place(name: "The Dugout", rating: 5, description: "Non-profit organization • GTB Nagar Delhi", latitude: 28.69694134114982,  longitude: 77.2094810746044),
        Place(name: "The Door Is Open", rating: 5, description: "Soup kitchen • GTB Nagar Delhi", latitude: 28.693458318726595, longitude: 77.20606514237288)
        
    ]
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.694990298420564,
            longitude: 77.20416949435659
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
        )
    )

    var body: some View {
        ZStack {
            VStack {
                if !show {
                    HStack {
                        Text("Explore")
                            .foregroundColor(Color(hex: "#3E6E79"))
                            .font(.title3)

                        Spacer()
                    }.padding(.top, 20)
                }
                Map(coordinateRegion: $region,annotationItems: places) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        Button(action: {
                            showDetails = true
                            details = place
                        }, label: {
                            Image("pin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55, alignment: .center)
                        })
                        }

                }
            }
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding(.horizontal, show ? 0 : 20)
            .background(Rectangle()
            .fill(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .shadow(radius: 8))
            if show {
                VStack {
                    HStack {
                        Button(action: {
                            show.toggle()
                            disableMenu.toggle()
                            showDetails = false
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }.padding([.leading, .top], 20)
                    SearchBar(text: $search)
                        .padding(.horizontal,20)
                        .padding(.top, 20)
                    Spacer()
                }
            }
            if showDetails {
                DetailedView(place: details, showDetails: $showDetails, y: $y, showCaptureImageView: $showCaptureImageView, show: $show)
                    .offset(y: showDetails ? UIScreen.main.bounds.height / 3 + y : UIScreen.main.bounds.height)
            }
        }.animation(.easeIn(duration: 0.5))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let rating: Int
    let description: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

