//
//  HomeScreen.swift
//  BoardBankUITests
//
//  Created by Maksim Akifev  on 4/23/18.
//  Copyright © 2018 Richard Neitzke. All rights reserved.
//

import XCTest

class HomeScreen: XCTest {
    
    // MARK: Screen Locators
    
    static let app = XCUIApplication()
    static let boardbankNavigationBar = app.navigationBars["BoardBank"]
    
    let collectionViews = app.collectionViews.cells.otherElements
    let deleteButton = app.buttons["Delete"]
    let add200Button = app.buttons["Add $200"]
    let renameButton = app.buttons["Rename"]
    let renamePlayerAlertOkButton = app.alerts["Rename Player"].buttons["OK"]
    let renamePlayerAlertTextField = app.alerts["Rename Player"].textFields[""]
    let settingsButton = boardbankNavigationBar.buttons["Settings"]
    let addPlayerButton = boardbankNavigationBar.buttons["Add"]
    
    // MARK: Screen Methods
    
    func isPlayerDisplayed(name: String, balance: String, currency: String) -> Bool {
        /**
         Check if player is dispaleyd on the screen
         - Parameter name: the text identifier for player name
         - Parameter balance: the text identifier for player balance
         - Parameter currency: the text identifier for player currency
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        return (player.exists)
        
    }
    
    func deletePlayerWith(name: String, balance: String, currency: String) {
        /**
         Delete the player
         - Parameter name: the text identifier for player name
         - Parameter balance: the text identifier for player balance
         - Parameter currency: the text identifier for player currency
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        player.tap()
        deleteButton.tap()
    }
    
    func addPlayerBalanceWith(name: String, balance: String, currency: String) {
        /**
         Add Player balance with default quick add amount
         - Parameter name: the text identifier for player name
         - Parameter balance: the text identifier for player balance
         - Parameter currency: the text identifier for player currency
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        player.tap()
        add200Button.tap()
    }
    
    func renamePlayerNameWith(name: String, balance: String, currency: String, newName: String) {
        /**
         Rename Player name
         - Parameter name: the text identifier for player name
         - Parameter balance: the text identifier for player balance
         - Parameter currency: the text identifier for player currency
         - Parameter newName: the text to enter into the field
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        player.tap()
        renameButton.tap()
        renamePlayerAlertTextField.clearAndEnterText(text: newName)
        renamePlayerAlertOkButton.tap()
    }
    
    func addPlayer() {
        /**
         Press Add button
         */
        addPlayerButton.tap()
    }
    
    func settings() {
        /**
         Press Settings button
         */
        settingsButton.tap()
    }
    
}
