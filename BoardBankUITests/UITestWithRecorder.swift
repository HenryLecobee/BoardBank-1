//
//  UITestWithRecorder.swift
//  BoardBankUITests
//
//  Created by Maksim Akifev on 5/5/18.
//  Copyright © 2018 Richard Neitzke. All rights reserved.
//

import XCTest

class UITestWithRecorder: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.navigationBars["BoardBank"].buttons["Add"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Player"]/*[[".cells.textFields[\"Player\"]",".textFields[\"Player\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Add Player"]/*[[".cells.staticTexts[\"Add Player\"]",".staticTexts[\"Add Player\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Element expected to be displayed
        let player = app.collectionViews.staticTexts["Test"]
        
        // Assert that element is displayed
        XCTAssertTrue(player.exists)

    }
    
}
