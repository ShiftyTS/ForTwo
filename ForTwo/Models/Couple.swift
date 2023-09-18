//
//  Couple.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-10.
//

import FirebaseFirestoreSwift

// Couple model
struct Couple: Identifiable, Decodable {
    @DocumentID var id: String?
    let daysTogether: Int
    let nicknameOne: String
    let nicknameTwo: String
    let questions: [String: [String: String]]
    let uidOne: String
    let uidTwo: String
}
