//
//  SimonUITests.swift
//  SimonUITests
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import XCTest

class SimonUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["testMode"]
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScreenshots() {
        
        let app = XCUIApplication()
        snapshot("0MainScreen")
        app.buttons["Play"].tap()
        snapshot("1SimonScreen")
        let blueButton = app.buttons["Blue"]
        NSThread.sleepForTimeInterval(1)
        blueButton.tap()
        NSThread.sleepForTimeInterval(1)
        blueButton.tap()
        blueButton.tap()
        NSThread.sleepForTimeInterval(1)
        blueButton.tap()
        blueButton.tap()
        blueButton.tap()
        NSThread.sleepForTimeInterval(1)
        app.buttons["Red"].tap()
        snapshot("2WrongAnswer")
        app.alerts["Wrong!"].collectionViews.buttons["OK"].tap()
    }
    
}
