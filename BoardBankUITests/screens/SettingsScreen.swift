//
//  SettingsScreen.swift
//  BoardBankUITests
//
//  Created by Maksim Akifev on 4/23/18.
//  Copyright © 2018 Richard Neitzke. All rights reserved.
//

import XCTest

class SettingsScreen: XCTest {
    
    // MARK: Setings Screen Locators
    
    static let cells = XCUIApplication().tables.cells
    
    let newGameButton = XCUIApplication().tables.staticTexts["New Game"]
    let areYouSureAlert = XCUIApplication().alerts["Are you sure?"].buttons["New Game"]
    let saveSettingsButton = XCUIApplication().buttons["Save Settings"]
    let cancelButton = XCUIApplication().navigationBars["Settings"].buttons["Cancel"]
    let currencyTextField = cells.containing(.staticText, identifier:"CURRENCY").children(matching: .textField).element
    let defaultBalanceTextField = cells.containing(.staticText, identifier:"DEFAULT BALANCE").children(matching: .textField).element
    let quickAmountTextField = cells.containing(.staticText, identifier:"QUICK ADD AMOUNT").children(matching: .textField).element
    let enableSoundSwitch = XCUIApplication().buttons["enableSoundSwitch"]

    // MARK: Settings Screen Methods
    
    func newGame() {
        /**
         Press New Game button
         */
        newGameButton.tap()
        areYouSureAlert.tap()
    }
    
    func setCurrencyWith(currency: String) {
        /**
         Set CURRENCY Text Field with new value
         - Parameter currency: the text to enter into the field
         */
        currencyTextField.tap()
        currencyTextField.clearAndEnterText(text: currency)        
    }
    
    func setDefaultBalanceWith(balance: String) {
        /**
         Set DEFAULT BALANCE Text Field with new value
         - Parameter balance: the text to enter into the field
         */
        defaultBalanceTextField.tap()
        defaultBalanceTextField.clearAndEnterText(text: balance)
    }
    
    func setQuickAddAmountWith(amount: String) {
        /**
         Set QUICK ADD AMOUNT Text Field with new value
         - Parameter amount: the text to enter into the field
         */
        quickAmountTextField.tap()
        quickAmountTextField.clearAndEnterText(text:amount)
    }
    
    func saveSettings() {
        /**
         Press Save Setings button
         */
       saveSettingsButton.tap()
    }
    
}
