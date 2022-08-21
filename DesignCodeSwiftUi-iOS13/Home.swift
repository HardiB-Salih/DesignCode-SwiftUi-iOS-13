//
//  HomeView.swift
//  DesignCodeSwiftUi-iOS13
//
//  Created by HardiBSalih on 20.08.2022.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    let bgColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(bgColor)
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: $showProfile)
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle.degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
            .edgesIgnoringSafeArea(.all)
            MenuView()
                .background(.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        viewState = value.translation
                        if viewState.height > 50 {
                            showProfile = false
                        }
                    }.onEnded { value in
                        viewState = .zero
                    }
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile : Bool
    var body: some View {
        Button(action: {
            showProfile.toggle()
        }) {
            Image("avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}


let screen = UIScreen.main.bounds
