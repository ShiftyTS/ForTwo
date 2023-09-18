//
//  QuestionRowView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-04.
//

import SwiftUI

// Displays individual question details
struct QuestionRowView: View {
    
    @State var questionText: String
    @State var questionNum: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            // Displays question number
            Text("#\(String(questionNum))")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.custom("ZapfinoExtraLT-One", size: 32))
                .foregroundColor(Color(red: 0xFC / 255, green: 0x4C / 255, blue: 0x4E / 255))
                .padding([.top], 7)
                .padding([.trailing], 2)
            
            // Displays question text
            Text(questionText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.custom("HermeneusOne-Regular", size: 18))
                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))

            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding([.horizontal], 12)
        .padding([.vertical], 10)
        .lineLimit(1)
        .truncationMode(.tail)
    }
}
