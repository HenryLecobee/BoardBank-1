## XCUITest Framework Tutorial

---

This repository provides complete example of setting up XCUITest Framework using Screen Objects Pattern for iOS Automation Testing.  [Original Tutorial is available in my blog](https://medium.com/@akifev/mobile-automation-testing-getting-started-with-xcode-ui-testing-5051cf61b558).

---

## Overview

### Screen Objects

* AddPlayerScreen.swift
* HomeScreen.swift    
* SettingsScreen.swift

### Test Case class

* AddPlayerTests.swift

### How to tap Button

```  settingsButton.tap() ```


### Verify that Element is exist on the screen 

```XCTAssertTrue(homeScreen.isPlayerDisplayed(name: testPlayerName1, balance: defaultPlayerBalance, currency: defaultCurrency))```


### How to type text

```currencyTextField.clearAndEnterText(text: currency) ```
