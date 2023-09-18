//
//  AuthViewModel.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-08.
//

import Foundation
import Firebase
import SwiftUI

// Authentication viewmodel
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var currentCouple: Couple?
    @Published var refreshCouple: Couple?
    @Published var questions: [String: [String: String]]?
    
    private let service = UserService()
    
    // Runs on initialization
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    // Registers user
    func register(userEmail: String, userPassword: String) {
        
        // Creates new user
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            // Updates user session
            self.userSession = user
            self.fetchUser()
            
            print("DEBUG: Registered new user \(self.userSession)")
            
            let userInfo = ["email": userEmail, "uid": user.uid, "nickname": "Nickname", "connected": false, "coupleId": "", "enteredCode" : false]
            
            // Adds new user to firestore collection
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(userInfo) { _ in
                    print("DEBUG: Upload user data")
                }
        }
    }
    
    // Signs in user
    func login(userEmail: String, userPassword: String) {
        
        // Signs user in
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            // Updates user session
            self.userSession = user
            self.fetchUser()
            
            print("User logged in")
        }
    }
    
    // Signs out user
    func signOut() {
        
        // Updates user session
        userSession = nil
        currentCouple = refreshCouple
        
        // Signs out
        try? Auth.auth().signOut()
    }
    
    // Disconnects couple
    func disconnectCouple() {
        service.disconnectCouple()
        currentCouple = refreshCouple
    }
    
    // Recovers password
    func recoverPassword(userEmail: String) {
        
        // Sends out password recovery email
        Auth.auth().sendPasswordReset(withEmail: userEmail) { error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
        }
    }
    
    // Fetches user
    func fetchUser() {
        print("here")
        guard let uid = self.userSession?.uid else { return }

        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            
            let coupleId = user.coupleId
            
            // Fetches updated couple as well if the user is already connected
            if user.connected {
                self.fetchCouple(coupleId: coupleId)
            }
        }
    }
    
    // Fetches couple
    func fetchCouple(coupleId: String) {
        service.fetchCouple(withCoupleId: coupleId) { couple in
            self.currentCouple = couple
        }
        
        // Updates questions
        fetchAllCoupleQuestions(coupleId: coupleId)
    }
    
    // Connects couple
    func connectCouple(uidPartner: String) {
        service.connectUserOffUid(withUid: uidPartner, curUserUid: self.userSession?.uid)
        
        // Updates user
        self.fetchUser()
    }
    
    // Changes user nickname
    func changeNickname(newNickname: String, coupleUid: String, changeNicknameOne: Bool) {
        service.changeNickname(newNickname: newNickname, coupleUid: coupleUid, changeNicknameOne: changeNicknameOne)
        
        // Updates user
        self.fetchUser()
    }
    
    // Fetches a new question from question bank
    func fetchNewQuestion(coupleId: String) {
        var questionTexts: [String] = []
        let questions = currentCouple?.questions ?? [:]
        
        // Creates dictionary of questions based on existing questions
        for question in questions {
            if let text = question.value["questionText"] {
                questionTexts.append(text)
            } else {
                print("error")
            }
        }
        
        var setQuestions = NSMutableOrderedSet(array: questionTexts)
        let count = setQuestions.count

        service.fetchNewQuestion(currentQuestions: setQuestions, numQuestions: count, coupleId: coupleId)
        
        // Updates couple
        self.fetchCouple(coupleId: coupleId)
    }
    
    // Fetches all of the couple's questions
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
                    
                    // Updates questions
                    self.questions = questions
                }
            }
    }
    
    // Updates question response
    func updateResponse(newResponse: String, mapNum: Int, coupleId: String, changeResponseOne: Bool) {
        service.updateResponse(newResponse: newResponse, mapNum: mapNum, coupleId: coupleId, changeResponseOne: changeResponseOne)

        // Updates couple
        self.fetchCouple(coupleId: coupleId)
    }
}
