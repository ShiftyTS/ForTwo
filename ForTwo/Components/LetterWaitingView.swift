//
//  LetterWaitingView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-07.
//

import SwiftUI

struct LetterWaitingView: View {
    var body: some View {
        Image("letter")
            .resizable()
            .scaleEffect(0.65)
            .scaledToFit()
            .border(.red)
            .padding([.bottom], 100)
    }
}

struct LetterWaitingView_Previews: PreviewProvider {
    static var previews: some View {
        LetterWaitingView()
    }
}
