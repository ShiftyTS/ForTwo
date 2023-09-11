//
//  Couple.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-10.
//

import FirebaseFirestoreSwift

struct Question: Codable {
  let questionText: String
  let responseOne: String
  let responseTwo: String
}

struct Couple: Identifiable, Decodable {
    @DocumentID var id: String?
    let daysTogether: Int
    let nicknameOne: String
    let nicknameTwo: String
    let questions: [[String: String]]  // [String: [String: String]]
    let uidOne: String
    let uidTwo: String
}
