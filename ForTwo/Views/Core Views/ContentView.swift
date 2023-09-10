//
//  ContentView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    @State private var isAuthenticated = false
//    @ObservedObject var viewModel: AuthViewModel
    @EnvironmentObject var viewModel: AuthViewModel
//    init() {
//            // Customize the appearance of the tab bar
//            let tabBarAppearance = UITabBarAppearance()
//            tabBarAppearance.configureWithOpaqueBackground()
//            if let backgroundImage = UIImage(named: "background") {
//                tabBarAppearance.backgroundImage = backgroundImage
//            }
////            tabBarAppearance.backgroundColor = UIColor.clear // Set the background color to clear
//            
//            UITabBar.appearance().standardAppearance = tabBarAppearance
//        }
    
    var body: some View {
        NavigationView {  //view vs stack?
            Group {
                if viewModel.userSession == nil {
                    LoginView(isAuthenticated: $isAuthenticated)
                } else {
                    mainView
                }
            }
//            .ignoresSafeArea()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .ObservedObject(AuthViewModel())
//            .objec
            .environmentObject(AuthViewModel())
    }
}

extension ContentView {
    var mainView: some View {
        TabView(selection: $selectedIndex) {
//            if !viewModel.didAuthenticateUser {
            if let user = viewModel.currentUser {
                if user.connected {
                    HomeView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
    //                        Label("Questions", Image: "homeicon")
                            Label("Home", image: "homeicon")
    //                            .font(Font.custom("ZapfinoExtraLT-One", size: 32))
    //                            .foregroundColor(Color(red: 0xFC / 255, green: 0x4C / 255, blue: 0x4E / 255))
    //                            .padding(10)
    //                        Image("homeicon")
    //                            .resizable()
    //                            .scaledToFit()
    //    //                        .offset(y: 60)
                        }.tag(0)
    //                    .padding(5)
                    QuestionsView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Label("Home", image: "mailboxicon")
                        }.tag(1)
                }
//                HomeView()
//                    .onTapGesture {
//                        self.selectedIndex = 0
//                    }
//                    .tabItem {
////                        Label("Questions", Image: "homeicon")
//                        Label("Home", image: "homeicon")
////                            .font(Font.custom("ZapfinoExtraLT-One", size: 32))
////                            .foregroundColor(Color(red: 0xFC / 255, green: 0x4C / 255, blue: 0x4E / 255))
////                            .padding(10)
////                        Image("homeicon")
////                            .resizable()
////                            .scaledToFit()
////    //                        .offset(y: 60)
//                    }.tag(0)
////                    .padding(5)
//                QuestionsView()
//                    .onTapGesture {
//                        self.selectedIndex = 1
//                    }
//                    .tabItem {
//                        Label("Home", image: "mailboxicon")
//                    }.tag(1)
//                MemoriesView()
//                    .onTapGesture {
//                        self.selectedIndex = 2
//                    }
//                    .tabItem {
//                        Label("Memories", systemImage: "3.circle")
//                    }.tag(2)
            }
            CoupleView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Label("Couple", image: "heartsicon")
                }.tag(3)
        }
        .accentColor(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
        .ignoresSafeArea()
//        .border(.red)
    }
}
