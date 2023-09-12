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
    @Published var refreshCouple: Couple?
    @Published var questions: [String: [String: String]]?
//    @Published var dataReloadTrigger = UUID()
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
//        self.fetchCouple()
//        if currentUser?.connected {
//            self.fetchCouple(coupleId: currentUser?.coupleId)
//        }
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
        currentCouple = refreshCouple
        // Signs user out on backend/server
        try? Auth.auth().signOut()
    }
    
    func disconnectCouple() {
        // Sest user session to nil, shows login view
//        currentUser = nil
//        currentCouple = nil
        service.disconnectCouple()
        
        currentCouple = refreshCouple
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
        
        fetchAllCoupleQuestions(coupleId: coupleId)
    }
    
    // uidOne is the current user's uid, uidTwo is the code they entered
    func connectCouple(uidPartner: String) {
        print("connectprints")
        
        service.connectUserOffUid(withUid: uidPartner, curUserUid: self.userSession?.uid)
        
        self.fetchUser()
//        self.fetchNewQuestion(coupleId: self.userSession?.uid ?? "" + uidPartner)
//        self.fetchUser()
    }
    
    func changeNickname(newNickname: String, coupleUid: String, changeNicknameOne: Bool) {
        print("changenick")
        print(coupleUid)
        
        service.changeNickname(newNickname: newNickname, coupleUid: coupleUid, changeNicknameOne: changeNicknameOne)
        
        self.fetchUser()
    }
    
    func fetchNewQuestion(coupleId: String) {
        var questionTexts: [String] = []
        let questions = currentCouple?.questions ?? [:]
        for question in questions {
            if let text = question.value["questionText"] {
                questionTexts.append(text)
            } else {
                print("error")
            }
//            print(question["questionText"])
        }
        
        var setQuestions = NSMutableOrderedSet(array: questionTexts)
        let count = setQuestions.count
        print(setQuestions)
//        print(questionTexts)
//        print(questions)
//        for question in
        service.fetchNewQuestion(currentQuestions: setQuestions, numQuestions: count, coupleId: coupleId)
        
        self.fetchCouple(coupleId: coupleId)
    }
    
    func fetchAllCoupleQuestions(coupleId: String) {
        let db = Firestore.firestore()
        db.collection("couples")
            .document(coupleId)
            .addSnapshotListener { snapshot, error in
                guard let document = snapshot, document.exists, let data = document.data() else {
                    print("Error fetching document: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                if let questions = data["questions"] as? [String: [String: String]] {
                    self.questions = questions
                }
            }
//
//
//        fetchCouple(coupleId: coupleId)
    }
    
    func updateResponse(newResponse: String, mapNum: Int, coupleId: String, changeResponseOne: Bool) {
        service.updateResponse(newResponse: newResponse, mapNum: mapNum, coupleId: coupleId, changeResponseOne: changeResponseOne)
        
//        fetchCouple(coupleId: coupleId)
//        { couple in
//            self.currentCouple = couple
//        }
        self.fetchCouple(coupleId: coupleId)
//        self.fetchAllCoupleQuestions(coupleId: coupleId)
//        fetchAllCoupleQuestions(coupleId: coupleId)
    }
}
