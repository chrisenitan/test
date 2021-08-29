//
//  strings.swift
//  UITestingTutorialUITests
//
//  Created by Chris Enitan on 09.07.21.
//  Copyright © 2021 Code Pro. All rights reserved.
//

import XCTest

let app = XCUIApplication()

struct selector {
    static var expectedUserName = "CodePro"
    static var expectedPassword = "abc123"
    static var fName = "Chris"
    static var password = "Yummy"
    static var tablesQuery = app.tables
    static var radioStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Radio"]/*[[".cells.staticTexts[\"Radio\"]",".staticTexts[\"Radio\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    static var justForYouBtn = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Just For You"]/*[[".cells.staticTexts[\"Just For You\"]",".staticTexts[\"Just For You\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    static var downloadsButton = app.tables.staticTexts["My Downloads"]
    static var loginButton = app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    static var profileButton = app.navigationBars["Mockify Music"].buttons["Profile"]
    static var usernameInput = app.textFields["Username"]
    static var passwordInput = app.secureTextFields["Password"]
    
}
