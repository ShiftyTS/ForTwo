//
//  QuestionRowView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-04.
//

import SwiftUI

struct QuestionRowView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Button(action: {}) {
                Text("#01")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(Font.custom("ZapfinoExtraLT-One", size: 32))
                    .foregroundColor(Color(red: 0xFC / 255, green: 0x4C / 255, blue: 0x4E / 255))
//                    .background(Color.clear)
//                    .foregroundColor(.black)
                    .padding([.top], 7)
                    .padding([.trailing], 2)
//                    .border(.blue)
                Text("What was your first impression of your partner?")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(Font.custom("HermeneusOne-Regular", size: 18))
                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                    .background(Color.clear)
//                    .foregroundColor(.black)
//                    .border(.blue)
                Spacer()
            }
//            Text("#01")
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Text("What was your first impression of your partner?")
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
//        .padding(3)
        .padding([.horizontal], 12)
        .padding([.vertical], 10)
//        .padding([.bottom], 6)
        .lineLimit(1)
        .truncationMode(.tail)
//        .border(.red)
        
//        Divider()
    }
}

struct QuestionRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionRowView()
    }
}
