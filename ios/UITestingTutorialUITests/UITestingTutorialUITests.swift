//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by Chris Enitan on 09.07.21.
//  Copyright © 2021 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    struct testString {
        static var fName = "Chris"
        static var pass = "12345"
    }
    
    
    func testExample() throws {

        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        //assert main page
        let tablesQuery = app.tables
        let radioStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Radio"]/*[[".cells.staticTexts[\"Radio\"]",".staticTexts[\"Radio\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let profileButton = app.navigationBars["Mockify Music"].buttons["Profile"]
        let justForYouBtn = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Just For You"]/*[[".cells.staticTexts[\"Just For You\"]",".staticTexts[\"Just For You\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let loginButton =   app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //define input fields
        let  usernameInput = app.textFields["Username"]
        let passwordInput = app.secureTextFields["Password"]
        
        
        //basic page assertions
        XCTAssertTrue(radioStaticText.exists)
        radioStaticText.tap()
        justForYouBtn.tap()
        radioStaticText.tap()
        
        //form actions
        profileButton.tap()
        
        //action username
        usernameInput.tap()
        usernameInput.typeText(testString.fName)
      
        //action password
        passwordInput.tap()
        usernameInput.typeText(testString.pass)
        
        loginButton.tap()
        XCTAssertTrue(app.alerts["Invalid Credentials"].exists)
        
        app.alerts["Invalid Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
