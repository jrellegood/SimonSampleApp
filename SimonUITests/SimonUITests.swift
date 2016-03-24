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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        let app = XCUIApplication()
        app.launchArguments = ["testMode"]
        app.launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        app.buttons["Play"].tap()
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
        app.alerts["Wrong!"].collectionViews.buttons["OK"].tap()
    }
    
}
