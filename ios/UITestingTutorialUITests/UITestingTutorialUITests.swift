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
    
 
    
    func testExample() throws {

        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //define input fields
        let  usernameInput = app.textFields["Username"]
        let passwordInput = app.secureTextFields["Password"]
        
        
        //basic page assertions
        XCTAssertTrue(selector.radioStaticText.exists)
        selector.radioStaticText.tap()
        selector.justForYouBtn.tap()
        selector.radioStaticText.tap()
        
        //click profile
        selector.profileButton.tap()
        
        //action username
        usernameInput.tap()
        usernameInput.typeText(selector.fName)
      
        //action password
        passwordInput.tap()
        passwordInput.typeText(selector.password)
        
        selector.loginButton.tap()
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
