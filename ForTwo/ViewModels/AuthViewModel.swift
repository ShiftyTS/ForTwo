//
//  AuthViewModel.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-08.
//

import Foundation
import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func register(userEmail: String, userPassword: String) {
        print("DEBUG: Register \(userEmail)")
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Registered new user \(self.userSession)")
            
            let userInfo = ["email": userEmail, "uid": user.uid, "nickname": "Nickname", "connected": false]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(userInfo) { _ in
                    print("DEBUG: Upload user data")
                }
        }
    }
    
    func login(userEmail: String, userPassword: String) {
        print("DEBUG: Login \(userEmail)")
    }
    
    func signOut() {
        // Sest user session to nil, shows login view
        userSession = nil
        
        // Signs user out on backend/server
        try? Auth.auth().signOut()
    }
}
