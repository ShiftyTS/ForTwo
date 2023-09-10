//
//  User.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-09.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let connected: Bool
    let email: String
    let enteredCode: Bool
    let nickname: String
    let coupleId: String
}
