//
//  UserService.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-09.
//

import Firebase
import FirebaseFirestoreSwift
//import fire

struct UserService {

    // Fetches user
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        
        // Grabs data from firestore using the given uid
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
            }
    }
    
    // Fetches couple
    func fetchCouple(withCoupleId coupleId: String, completion: @escaping(Couple) -> Void) {
        
        // Grabs data from firestore using the given coupleId
        Firestore.firestore().collection("couples")
            .document(coupleId)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {
                    print("Fail")
                    return
                    
                }
                
                guard let couple = try? snapshot.data(as: Couple.self) else {
                    print("Fail")
                    return
                    
                }
                
                completion(couple)
            }
    }
    
    // Connects couple
    func connectUserOffUid(withUid uid: String, curUserUid: String?) {
        let db = Firestore.firestore()
        
        // Grabs  other user's information
        db.collection("users")
            .document(uid)
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    let uidTwo = document.get("uid")
                    let nicknameTwo = document.get("nickname")
                    let userInfo: [String: Any] = [
                        "uidOne": curUserUid,
                        "uidTwo": uidTwo,
                        "nicknameOne": "DefaultName",
                        "nicknameTwo": "DefaultName",
                        "daysTogether": 1,
                        "questions": [:]
                    ]
                    
                    guard let stringCurUid = try? curUserUid as? String else { return }
                    guard let stringUidTwo = try? uidTwo as? String else { return }
                    let combinedUid = stringCurUid + stringUidTwo
                    
                    // Creates a new couple using grabbed data
                    db.collection("couples")
                        .document(combinedUid)
                        .setData(userInfo) { _ in
                            print("DEBUG: Upload couple data")
                        }
                    
                    let userOne = db.collection("users").document(stringCurUid)
                    let userTwo = db.collection("users").document(stringUidTwo)
                    
                    // Updates user one data to be connected
                    userOne.updateData([
                        "coupleId": combinedUid,
                        "connected": true,
                        "enteredCode": true
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                    
                    // Updates user two data to be connected
                    userTwo.updateData([
                        "coupleId": combinedUid,
                        "connected": true
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                } else {
                    print("User with given Uid does not exist!")
                }
            }
    }
    
    // Changes nickname
    func changeNickname(newNickname: String, coupleUid: String, changeNicknameOne: Bool) {
        let db = Firestore.firestore()
        
        // Changes appropriate nickname
        if changeNicknameOne {
            
            // Updates nickname one
            db.collection("couples")
                .document(coupleUid)
                .updateData([
                    "nicknameOne": newNickname
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
        } else {
            
            // Updates nickname two
            db.collection("couples")
                .document(coupleUid)
                .updateData([
                    "nicknameTwo": newNickname
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
        }
    }
    
    // Fetches new question
    func fetchNewQuestion(currentQuestions: NSMutableOrderedSet, numQuestions: Int, coupleId: String) {
        let db = Firestore.firestore()
        
        // Enter question bank collection
        db.collection("allQuestions")
            .document("questions")
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    if let dataDescription = document.data(), var questionsArray = dataDescription["questionTexts"] as? [String] {
                        
                        // Shuffles questions to get random one
                        questionsArray.shuffle()
                        
                        // Iterates through the couple's existing questions and repeatedly trys to add question from bank to map
                        for question in questionsArray {
                            currentQuestions.add(question)
                            let newCount = currentQuestions.count
                            if newCount != numQuestions {
                                
                                // Updates couple's questions
                                db.collection("couples")
                                    .document(coupleId)
                                    .updateData([
                                        "questions.\(newCount).questionText": question,
                                        "questions.\(newCount).questionNum": String(newCount),
                                        "questions.\(newCount).responseOne": "",
                                        "questions.\(newCount).responseTwo": ""
                                    ])
                                break
                            }
                        }
                    }
                } else {
                    print("Document does not exist")
                }
            }
    }
    
    // Updates question response
    func updateResponse(newResponse: String, mapNum: Int, coupleId: String, changeResponseOne: Bool) {
        let db = Firestore.firestore()
        
        // Changes appropriate user's response
        if changeResponseOne {
            
            // Updates data in couples collection
            db.collection("couples")
                .document(coupleId)
                .updateData([
                    "questions.\(mapNum).responseOne": newResponse
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
        } else {
            
            // Updates data in couples collection
            db.collection("couples")
                .document(coupleId)
                .updateData([
                    "questions.\(mapNum).responseTwo": newResponse
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
        }
    }
    
    // Disconnectes couple
    func disconnectCouple() {
        
    }
}
