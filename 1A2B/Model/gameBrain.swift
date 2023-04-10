//
//  gameBrain.swift
//  1A2B
//
//  Created by 吳兆哲 on 2023/4/5.
//

import Foundation

struct gamebrain {
    
    func playGame(guess: Int, answer: Int) -> String {
        var a = 0
        var b = 0
        
        let guessCode = String(guess).compactMap{ $0.wholeNumberValue }
        let answerCode = String(answer).compactMap{ $0.wholeNumberValue }
        
        for (index, digit) in guessCode.enumerated() {
            if digit == answerCode[index] {
                a += 1
            } else if answerCode.contains(digit) {
                b += 1
            }
        }
        
        return "\(a)A\(b)B"
    }
    
    func randomNumber() -> Int {
        var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9] // 1~9 的數字
        var result = 0
        
        for _ in 0..<4 {
            let randomIndex = Int.random(in: 0..<numbers.count) // 從 numbers 中隨機選一個數字
            let digit = numbers[randomIndex]
            numbers.remove(at: randomIndex) // 從 numbers 中移除已選的數字
            result *= 10
            result += digit
        }
        
        return result
    }
    
}
