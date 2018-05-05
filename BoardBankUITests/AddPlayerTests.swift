//
//  AddPlayerTests.swift
//  BoardBankUITests
//
//  Created by Maksim Akifev  on 4/23/18.
//  Copyright © 2018 Richard Neitzke. All rights reserved.
//

import XCTest

class AddPlayerTests: XCTestCase {
    
    // MARK: Test Data
    
    let testPlayerName1 = "testPlayerName1"
    let testPlayerName2 = "testPlayerName2"
    let testCurrency = "@"
    let testPlayerBalance1 = "99.999"
    let testPlayerBalance2 = "77.777"
    let defaultPlayerBalance = "1.500"
    let defaultPlayerBalancePlusDefaultAddBalance = "1.700"
    let defaultCurrency = "$"
    
    // MARK: Screen Objects initializers
    
    let settingsScreen = SettingsScreen()
    let addPlayerScreen = AddPlayerScreen()
    let homeScreen = HomeScreen()
    
    // MARK: Test support methods
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        // Starting testing from clear state
        homeScreen.settings()
        settingsScreen.newGame()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testAddPlayerWithDefaultBalance() {
        /**
         Add new Player with default balance and assert that added player is displayed on the Home Screen
         */
        homeScreen.addPlayer()
        addPlayerScreen.setPlayerNameWith(testPlayerName1)
        addPlayerScreen.addPlayer()
        
        XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName1, balance: defaultPlayerBalance, currency: defaultCurrency))
    }
    
    func testAddPlayerWithDefaultBalanceThenDelete() {
        /**
         Add new Player with default balance and assert that added player is displayed on the Home Screen
         Then delete the added player and assert that deleted player is not displayed on the Home Screen
         */
        self.testAddPlayerWithDefaultBalance()
        homeScreen.deletePlayerWith(name: testPlayerName1, balance: defaultPlayerBalance, currency: defaultCurrency)
        
        XCTAssertFalse(homeScreen.isPlayerDisplayed(name: testPlayerName1, balance: defaultPlayerBalance, currency: defaultCurrency))
    }
    
    func testAddTwoPlayerWithCustomBalance() {
        /**
         Add two new Players with custom balance and assert that added players are displayed on the Home Screen
         */
        homeScreen.addPlayer()
        addPlayerScreen.setPlayerNameWith(testPlayerName1)
        addPlayerScreen.setPlayerBalanceWith(testPlayerBalance1)
        addPlayerScreen.addPlayer()
        
        homeScreen.addPlayer()
        addPlayerScreen.setPlayerNameWith(testPlayerName2)
        addPlayerScreen.setPlayerBalanceWith(testPlayerBalance2)
        addPlayerScreen.addPlayer()
        
        XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName1, balance: testPlayerBalance1, currency: defaultCurrency))
        XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName2, balance: testPlayerBalance2, currency: defaultCurrency))
    }
    
    func testAddPlayerWithCustomBalanceThenRename() {
        /**
         Add new Player with custom balance and rename then assert that modified player is displayed on the Home Screen
         */
        homeScreen.addPlayer()
        addPlayerScreen.setPlayerNameWith(testPlayerName1)
        addPlayerScreen.setPlayerBalanceWith(testPlayerBalance1)
        addPlayerScreen.addPlayer()
        homeScreen.renamePlayerNameWith(name: testPlayerName1, balance: testPlayerBalance1, currency: defaultCurrency, newName: testPlayerName2)
        
        XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName2, balance: testPlayerBalance1, currency: defaultCurrency))
    }
    
    func testAddPlayerWithDefaultBalanceThenAddQuickAddAmount() {
        /**
         Add new Player with default balance and add quick add amountthen assert that that modified player is displayed on the Home Screen
         */
        homeScreen.addPlayer()
        addPlayerScreen.setPlayerNameWith(testPlayerName1)
        addPlayerScreen.setPlayerBalanceWith(defaultPlayerBalance)
        addPlayerScreen.addPlayer()
        homeScreen.addPlayerBalanceWith(name: testPlayerName1, balance: defaultPlayerBalance, currency: defaultCurrency)
        
        XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName1, balance: defaultPlayerBalancePlusDefaultAddBalance, currency: defaultCurrency))
    }
    
}
