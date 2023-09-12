//
//  QuestionsViewModel.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-10.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    
    let service = QuestionService()
    
//    init() {
//
//    }
    
    func fetchNewQuestion() {
        print()
        service.fetchNewQuestion()
    }
}
