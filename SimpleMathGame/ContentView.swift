//
//  ContentView.swift
//  SimpleMathGame
//
//  Created by Shah Md Imran Hossain on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray: [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 100
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.title)
                .bold()
            
            Spacer()
            
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            
            HStack {
                ForEach(0..<2) { index in
                    Button {
                        isCorrectAnswer(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButtonView(answer: choiceArray[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) { index in
                    Button {
                        isCorrectAnswer(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButtonView(answer: choiceArray[index])
                    }
                }
            }
            
            Spacer()
        }
        .onAppear {
            generateAnswers()
        }
    }
}

// MARK: - Game methods
extension ContentView {
    func generateAnswers() {
        if score < 10 {
            difficulty = 10
        } else if score < 25 {
            difficulty = 100
        } else {
            difficulty = 1000
        }
        
        firstNumber = Int.random(in: 0...(difficulty / 2))
        secondNumber = Int.random(in: 0...(difficulty / 2))
        correctAnswer = firstNumber + secondNumber
        
        var ansList = [Int]()
        
        for _ in 0...2 {
            ansList.append(Int.random(in: 0...difficulty))
        }
        
        ansList.append(correctAnswer)
        choiceArray = ansList.shuffled()
    }
    
    func isCorrectAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
        } else {
            score -= 1
        }
    }
}

#Preview {
    ContentView()
}
