//
//  AnswerButtonView.swift
//  SimpleMathGame
//
//  Created by Shah Md Imran Hossain on 12/11/23.
//

import SwiftUI

struct AnswerButtonView: View {
    let answer: Int
    
    var body: some View {
        Text("\(answer)")
            .frame(width: 110, height: 110)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(Circle())
            .padding()
    }
}

#Preview {
    AnswerButtonView(answer: 100)
}
