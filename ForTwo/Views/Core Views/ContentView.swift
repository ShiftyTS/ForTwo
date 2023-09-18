//
//  ContentView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

// Displays app contents
struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var isAuthenticated = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Group {
                
                // If the user is not signed in redirects user to log in page, otherwise displays the main view
                if viewModel.userSession == nil {
                    LoginView(isAuthenticated: $isAuthenticated)
                } else {
                    mainView
                }
            }
        }

    }
}

// Displays the main tabs for the app
extension ContentView {
    var mainView: some View {
        TabView(selection: $selectedIndex) {
            if let user = viewModel.currentUser {
                
                // Only displays the 'Home' and 'Questions' tabs if the user is connected with another user
                if user.connected {
                    HomeView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Label("Home", image: "homeicon")
                        }.tag(0)
                    QuestionsView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Label("Home", image: "mailboxicon")
                        }.tag(1)
                }
            }
            
            // Always displays the "Couple" tab as this is where the user goes to connect to another user
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
    }
}
