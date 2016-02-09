//
//  SimonModelTests.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import XCTest
import Simon

class SimonModelTests: XCTestCase {

    func testIfPickWrongColorThenGetFalseFromVerify() {
        XCTAssertFalse(simonModel.verifyColor(.Red))
    }
    
    func testIfPickRightColorTHenGetTrueFromVerify() {
        XCTAssertTrue(simonModel.verifyColor(.Blue))
    }
    
    func testIfPickRightColorAndEndOfRoundThenScoreIncreases() {
        simonModel.verifyColor(.Blue)
        XCTAssertEqual(simonModel.score, 1)
    }
    
    func testRoundOverWhenAnswerAllColors() {
        for _ in simonModel.currentNumbers {
            simonModel.verifyColor(.Blue)
        }
        
        XCTAssertTrue(simonModel.isRoundOver())
    }
    
    func testWhenRoundOverThenNextRoundHasOneMoreColor() {
        let previousNumberOfColors = simonModel.currentNumbers.count
        
        for _ in simonModel.currentNumbers {
            simonModel.verifyColor(.Blue)
        }
        
        XCTAssertEqual(previousNumberOfColors + 1, simonModel.currentNumbers.count)
    }

    let simonModel = SimonModel(simonNumberGenerator: BlueSimonNumberGenerator())
}
