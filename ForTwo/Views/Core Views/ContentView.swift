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
        NavigationView {
            Group {
                if viewModel.userSession == nil {
                    LoginView(isAuthenticated: $isAuthenticated)
                } else {
                    mainView
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}

extension ContentView {
    var mainView: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
//                    Label("Questions", Image("homeicon"))
                    Image("homeicon")
//                        .offset(y: 60)
                }.tag(0)
            QuestionsView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Label("Questions", systemImage: "2.circle")
                }.tag(1)
            MemoriesView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Label("Memories", systemImage: "3.circle")
                }.tag(2)
            CoupleView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Label("Couple", systemImage: "4.circle")
                }.tag(3)
        }
    }
}
