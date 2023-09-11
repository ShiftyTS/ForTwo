//
//  QuestionAnswerView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-11.
//

import SwiftUI

struct QuestionAnswerView: View {
    @State private var isEditing = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image("backicon")
                        .resizable()
                        .scaledToFit()
                                    .scaleEffect(0.1)
                }
            }
            .padding()
        }
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView()
            .environmentObject(AuthViewModel())
    }
}
