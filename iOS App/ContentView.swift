//
//  ContentView.swift
//  MyTreat
//
//  Created by Aviral Yadav on 16/02/21.
//
import SwiftUI

class currentUser: ObservableObject {
    @Published var user = User(facebookId: "", name: "", email: "", id: 0)
}

struct ContentView : View {
    @State var demoLogin = false
    @ObservedObject var currentGiver = currentUser()
    var body: some View{
        if (currentGiver.user.facebookId != "" || demoLogin) {
            Home().ignoresSafeArea(.all, edges: .vertical).statusBar(hidden: true)
        } else {
            Onboarding(currentGiver: currentGiver, login: $demoLogin).ignoresSafeArea(.all, edges: .vertical).statusBar(hidden: true)
        }
    }
}
