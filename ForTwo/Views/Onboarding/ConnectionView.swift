//
//  ConnectionView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-08.
//

import SwiftUI

struct ConnectionView: View {
    var body: some View {
        ZStack() {
            Color(red: 0xE6 / 255, green: 0xC8 / 255, blue: 0xCB / 255)
                .ignoresSafeArea()
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
