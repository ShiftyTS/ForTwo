//
//  ForTwoApp.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // Sets up custom app appearances and Firebase on launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        if let backgroundImage = UIImage(named: "background") {
            tabBarAppearance.backgroundImage = backgroundImage
        }
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let appearance = UINavigationBarAppearance()
        if let backgroundImage = UIImage(named: "background") {
            appearance.backgroundImage = backgroundImage
        }
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        FirebaseApp.configure()
        return true
    }
}

@main
struct ForTwoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
