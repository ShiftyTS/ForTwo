//
//  ForTwoApp.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Customize the appearance of the tab bar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        if let backgroundImage = UIImage(named: "background") {
            tabBarAppearance.backgroundImage = backgroundImage
        }
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        // Customize the appearance of the navigation bar
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
    // inject into SwiftUI life-cycle via adaptor !!!
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            QuestionsView()
            ContentView()
//            LoginView()
        }
    }
}
