//
//  AddPlayerScreen.swift
//  BoardBankUITests
//
//  Created by Maksim Akifev on 4/23/18.
//  Copyright © 2018 Richard Neitzke. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    func clearAndEnterText(text: String) {
        /**
         Removes any current text in the field before typing in the new value
         - Parameter text: the text to enter into the field
         */
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}

class AddPlayerScreen: XCTest {
    
    // MARK: AddPlayerScreen Locators
    
    let playerTextFieldLocator = XCUIApplication().textFields["Player"]
    let balanceTextFieldLocator = XCUIApplication().textFields["1500"]
    let addPlayerButtonLocator = XCUIApplication().staticTexts["Add Player"]
    
    // MARK: AddPlayerScreen Methods
    
    func setPlayerNameWith(_ name: String) {
        /**
         Set Player Name Text Field with new value
         - Parameter name: the text to enter into the field
         */
       playerTextFieldLocator.tap()
       playerTextFieldLocator.typeText(name)
    }
    
    func setPlayerBalanceWith(_ balance: String) {
        /**
         Set Player Balance Text Field with new value
         - Parameter balance: the text to enter into the field
         */
        balanceTextFieldLocator.tap()
        balanceTextFieldLocator.clearAndEnterText(text: balance)
    }
    
    func setPlayerImageWith(_ image: String) {
        /**
         Set Player Image with new value
         - Parameter image: image identifier for new value
         */
        let imageSelectorLocator = XCUIApplication().tables/*@START_MENU_TOKEN@*/.collectionViews/*[[".cells.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.otherElements.containing(.image, identifier:image).element
        imageSelectorLocator.tap()
    }
    
    func addPlayer() {
        /**
         Press Add button
         */
        addPlayerButtonLocator.tap()
    }
    
}
