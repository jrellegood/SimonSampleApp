//
//  SimonModel.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import Foundation

enum SimonColor {
    case Red
    case Blue
    case Yellow
    case Green
}

class SimonModel {
    init(simonNumberGenerator: SimonNumberGenerator) {
        self.simonNumberGenerator = simonNumberGenerator
        
        currentNumbers.append(simonNumberGenerator.newColor())
    }
    
    func verifyColor(color: SimonColor) -> Bool {
        if color == currentNumbers[currentIndex] {
            if currentIndex == currentNumbers.count - 1 {
                setUpForNextRound()
            } else {
                currentIndex++
            }
            return true
        } else {
            return false
        }
    }
    
    func isRoundOver() -> Bool {
        return currentIndex == 0
    }
    
    func setUpForNextRound() {
        currentIndex = 0
        score++
        currentNumbers.append(simonNumberGenerator.newColor())
    }
    
    let simonNumberGenerator: SimonNumberGenerator
    var currentNumbers = [SimonColor]()
    var score = 0
    var currentIndex = 0
}