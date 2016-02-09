//
//  SimonColorGenerator.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import Foundation

protocol SimonNumberGenerator {
    func newColor() -> SimonColor
}

class RandomSimonNumberGenerator: SimonNumberGenerator {
    func newColor() -> SimonColor {
        let randomNumber = arc4random_uniform(4) % 4
        var color: SimonColor
        
        switch randomNumber {
        case 0:
            color = .Red
        case 1:
            color = .Green
        case 2:
            color = .Yellow
        case 3:
            color = .Blue
        default:
            color = .Red
        }
        
        return color
    }
}

class BlueSimonNumberGenerator: SimonNumberGenerator {
    func newColor() -> SimonColor {
        return .Blue
    }
}