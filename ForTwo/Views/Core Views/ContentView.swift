//
//  ContentView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    
    var body: some View {
        NavigationView {
            if isAuthenticated {
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "1.circle")
                        }

                    QuestionsView()
                        .tabItem {
                            Label("Questions", systemImage: "2.circle")
                        }
                    MemoriesView()
                        .tabItem {
                            Label("Memories", systemImage: "2.circle")
                        }
                    CoupleView()
                        .tabItem {
                            Label("Couple", systemImage: "2.circle")
                        }

                    // Add more views and tab items as needed

                }
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
