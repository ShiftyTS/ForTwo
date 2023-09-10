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

    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        print("awtvyudbahsduijabndijanwsdjoandjon")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
//                print("Email: \(user.email)")
//                print("Nickname: \(user.nickname)")
//                print("id: \(user.id)")
//                print("Connected: \(user.connected)")
//                print("CoupleID: \(user.coupleId)")
            }
        print("after")
    }
    
    func fetchCouple(withCoupleId coupleId: String, completion: @escaping(Couple) -> Void) {
        print("couples")
        Firestore.firestore().collection("couples")
            .document(coupleId)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {
                    print("094587")
                    return
                    
                }
                
                guard let couple = try? snapshot.data(as: Couple.self) else {
                    print("745897")
                    return
                    
                }
                
                completion(couple)
//                print("Email: \(user.email)")
                print("Nickname: \(couple.nicknameOne)")
                print("test \(couple.questions["question1"])")
//                print("id: \(user.id)")
//                print("Connected: \(user.connected)")
//                print("CoupleID: \(user.coupleId)")
            }
        print("after")
    }
    
    func connectUserOffUid(withUid uid: String, curUserUid: String?) {
        print("offuid")
//        print(curUserNickname)
//        print(curUserUid)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .getDocument { (document, error) in
                if let document = document, document.exists {
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                            print("Document data: \(dataDescription)")
//                    let emailTwo = document.get("email")
                    
                    
                    
                    
                    let uidTwo = document.get("uid")
                    let nicknameTwo = document.get("nickname")

                    print("before123")
//                    print(currentUser?.id)
                    let userInfo: [String: Any] = [
                        "uidOne": curUserUid,
                        "uidTwo": uidTwo,
                        "nicknameOne": "DefaultName",
                        "nicknameTwo": "DefaultName",
                        "daysTogether": 1,
                        "questions": [
                            "1": [
                                "Test question"
                            ]
                        ]
                    ]

//                    let userInfo = ["test": "dwad"]
//                    guard let user = try? snapshot.data(as: User.self) else { return }
                    
                    guard let stringCurUid = try? curUserUid as? String else { return }
                    guard let stringUidTwo = try? uidTwo as? String else { return }
                    let combinedUid = stringCurUid + stringUidTwo
//                    print(combinedUid)
//                    guard let combinedUid = try?
                    // Forms new couple with the given uids
                    db.collection("couples")
                        .document(combinedUid)
                        .setData(userInfo) { _ in
                            print("DEBUG: Upload couple data")
        //                    self.didAuthenticateUser = true
                        }
                    
                    let userOne = db.collection("users").document(stringCurUid)
                    let userTwo = db.collection("users").document(stringUidTwo)
                    
                    userOne.updateData([
                        "coupleId": combinedUid,
                        "connected": true
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                    
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
                    
                    print("after123")

                } else {
                    print("User with given Uid does not exist!")
                }
            }
        print("afteroffuid")
    }
    
    func changeNickname(newNickname: String, coupleUid: String) {
//        let db = Firestore.firestore()
//        db.collection("couples")
//            .document(coupleUid)
//            .updateData([
//                ""// hgow to know nickname one vs nicknametwo? // change the user nickname, then set nikcnameone to
//            ])
        print("at change")
    }
}
