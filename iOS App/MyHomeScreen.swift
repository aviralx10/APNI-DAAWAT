//
//  MyHomeScreen.swift
//  MyTreat
//
//  Created by Aviral Yadav on 16/02/21.
//

import SwiftUI

struct MyHomeScreen: View {
    @Binding var show : Bool
    @Binding var disableMenu : Bool
    @Binding var showCaptureImageView: Bool
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    TopView().frame(height: UIScreen.main.bounds.height / 3)
                        .border(Color.black)
                    MidView().frame(height: UIScreen.main.bounds.height / 3)
                    Spacer()
                }
                ZStack {
                    VStack {
                      MapView(show: $show, disableMenu: $disableMenu, showCaptureImageView: $showCaptureImageView)
                    }.allowsHitTesting(show)
                    Button(action: {
                        if !show {
                            show.toggle()
                            disableMenu.toggle()
                        }
                    }) {
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    }.opacity(show ? 0 : 1)
                }.offset(y: show ? 0 : UIScreen.main.bounds.height / 1.5 )
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

