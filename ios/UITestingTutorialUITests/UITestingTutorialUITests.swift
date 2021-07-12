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
        app.terminate()
    }
    
 
    
    func testLogin() throws {

        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        //basic page assertions
        XCTAssertTrue(selector.radioStaticText.exists)
        selector.radioStaticText.tap()
        selector.justForYouBtn.tap()
        selector.radioStaticText.tap()
        
        //click profile
        selector.profileButton.tap()
        
        //action username
        selector.usernameInput.tap()
        selector.usernameInput.typeText(selector.fName)
      
        //action password
        selector.passwordInput.tap()
        selector.passwordInput.typeText(selector.password)
        //selector.passwordInput.typeText(ProcessInfo.environment["account_name"])
      
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
