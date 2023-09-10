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
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var currentCouple: Couple?
    @Published var dataReloadTrigger = UUID()
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
//        self.fetchCouple()
//        print("DEBUG: User session is \(self.userSession?.uid)")
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
            self.fetchUser()
            print("DEBUG: Registered new user \(self.userSession)")
            
            let userInfo = ["email": userEmail, "uid": user.uid, "nickname": "Nickname", "connected": false, "coupleId": "", "enteredCode" : false]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(userInfo) { _ in
                    print("DEBUG: Upload user data")
//                    self.didAuthenticateUser = true
                }
        }
        
//        self.fetchUser()
    }
    
    // also make it show for login so if after registering the person closes app and reopens somehwere else and logs in they still see that connectionview
    func login(userEmail: String, userPassword: String) {
//        print("DEBUG: Login \(userEmail)")
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            print("User logged in")
        }
        
//        self.fetchUser()
//        self.currentUser
    }
    
    func signOut() {
        // Sest user session to nil, shows login view
        userSession = nil
//        currentUser = nil
//        currentCouple = nil
        // Signs user out on backend/server
        try? Auth.auth().signOut()
    }
    
    func recoverPassword(userEmail: String) {
        Auth.auth().sendPasswordReset(withEmail: userEmail) { error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchUser() {
        print("here")
        guard let uid = self.userSession?.uid else { return }

        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            
            let coupleId = user.coupleId
            
            if user.connected {
                print("abc")
                self.fetchCouple(coupleId: coupleId)
            }
//            self.fetchCouple(coupleId: coupleId)
        }
    }
    
    func fetchCouple(coupleId: String) {
        print("fetchcouplefirst")
//        guard let coupleId = currentUser?.coupleId else {
//            print("returdawdwadawdn")
//            return
//
//        }
        print(coupleId)  //gopt couple id!
//        let coupleId = "ttt"
        service.fetchCouple(withCoupleId: coupleId) { couple in
            self.currentCouple = couple
        }
    }
    
    // uidOne is the current user's uid, uidTwo is the code they entered
    func connectCouple(uidPartner: String) {
        print("connectprints")
        
        service.connectUserOffUid(withUid: uidPartner, curUserUid: self.userSession?.uid)
        
        self.fetchUser()
//        self.fetchUser()
    }
    
//    func changeNickname(newNickname: String, coupleUid: String) {
//        print("changenick")
//
//        service.changeNickname(newNickname: newNickname, coupleUid: coupleUid)
//    }
    
//    func reloadData() async {
//        dataReloadTrigger = UUID()
//    }
}
