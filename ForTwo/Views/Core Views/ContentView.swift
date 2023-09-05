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
            if !isAuthenticated {
                TabView(selection: $selectedIndex) {
                    HomeView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Label("Home", systemImage: "1.circle")
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
                        }.tag(3)
                    CoupleView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            Label("Couple", systemImage: "4.circle")
                        }.tag(3)

                    // Add more views and tab items as needed

                }
//                .background(Color.clear)
//                .background(.black)
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                .zIndex(1)
//                .background(.black)
//                .overlay(
//                    VStack {
//                        Spacer()
//                        Rectangle()
//                            .foregroundColor(.green)
//                            .frame(height: tabBarHeight)
//                    })
//                .edgesIgnoringSafeArea(.all)
//                .toolbarBackground(.indigo, for: .tabBar)
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                .navigationBarTitle("Top Tab Bar Example", displayMode: .inline)
//                .foregroundColor(.black)
            } else {
                LoginView(isAuthenticated: $isAuthenticated)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
