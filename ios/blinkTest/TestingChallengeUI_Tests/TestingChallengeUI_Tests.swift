//
//  TestingChallengeUI_Tests.swift
//  TestingChallengeUI_Tests
//
//  Created by Chris Enitan on 15.07.21.
//  Copyright © 2021 Blinks Labs GmbH. All rights reserved.
//

import XCTest

class TestingChallengeUI_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        print("Test Started")
    }
    override func tearDownWithError() throws {
        print("Test Ended")
    }
    
    //TESTS:
    
    //Test Page Assertions
    func testPageAssertions() throws {
        try XCTSkipIf(UIDevice.current.userInterfaceIdiom != .phone, "Test not needed on !phone")
        //instantiate dependencies and launch app
        let testBook = testBooks()
        let app = XCUIApplication()
        app.launch()
        
        //assert page title, youtube button and first book
        XCTAssert(selector.appHeaderTitle.exists)
        XCTAssert(selector.youtubeBtn.exists)
        Command().assertBook(req: testBook.idd241b2b.name)
    }
    
    //Test Book List
    func testBookList() throws {
        //instantiate dependencies and launch app
        let testBook = testBooks()
        let app = XCUIApplication()
        app.launch()
        
        //assert first book
        Command().assertBook(req: testBook.idd241b2b.name)
        Command().tapBook(req: testBook.idd241b2b.name)
        Command().assertPrompt(req: "You clicked on the \(testBook.idd241b2b.name) book")
        selector.okButton.tap()
        
        //assert mid-view book
        Command().assertBook(req: testBook.id2cb8609.name)
        Command().tapBook(req: testBook.id2cb8609.name)
        Command().assertPrompt(req:"You clicked on the \(testBook.id2cb8609.name) book")
        selector.okButton.tap()
        
        //swipe down
        app.swipeUp()
        
        //assert last book
        Command().assertBook(req: testBook.id99c1c39.name)
        Command().tapBook(req: testBook.id99c1c39.name)
        Command().assertPrompt(req:"You clicked on the \(testBook.id99c1c39.name) book")
        selector.okButton.tap()
    }
    
    //Test YouTube Play
    func testYoutubePlay() throws {
        //instantiate dependencies and launch app
        let testBook = testBooks()
        let app = XCUIApplication()
        app.launch()
        
        //tap on Youtube button
        selector.youtubeBtn.tap()
        
        //first device run: agree to dismiss youtube cookie terms
        if app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["cookies"]/*[[".otherElements[\"BrowserView?WebViewProcessID=1739\"].webViews.webViews.webViews",".otherElements.matching(identifier: \"Before you continue to YouTube\")",".links[\"cookies\"].staticTexts[\"cookies\"]",".staticTexts[\"cookies\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.isHittable{
            app.swipeUp()
            selector.agreeYTCookiesBtn.doubleTap()
            
            let app = XCUIApplication()
            let pauseVideoSwitch = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Pause video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Pause video\"]",".switches[\"Pause video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
            pauseVideoSwitch.tap()
            app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Play video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Play video\"]",".switches[\"Play video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
            pauseVideoSwitch.tap()
            
            let aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["April Fools 2017: How we blink books | Inside Blinkist 10K views Show more"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
            aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton.tap()
            pauseVideoSwitch.tap()
            app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["Time elapsed0:33"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"]",".staticTexts[\"0:33\"]",".staticTexts[\"Time elapsed0:33\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
            aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton.tap()
            app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Description Close"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"Description Close\"]",".buttons[\"Description Close\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
            let waitForNetwork = XCTWaiter.wait(for: [expectation(description: "Wait for 2 seconds")], timeout: 2.0)
            if waitForNetwork == XCTWaiter.Result.timedOut {
                print(description)
            }
        }
        
        //assert youtube page. videoDescription is not stable due to dynamic views value
        //XCTAssert(selector.videoDescription.isHittable)
        XCTAssert(selector.youtubePageBanner.exists)
        
        //navigate back and assert book list
        app.otherElements.buttons["Done"].tap()
        Command().assertBook(req: testBook.idd241b2b.name)
        
        
        //get line
        
        
        
    }
    
    
    func testYoutubePlayBack() throws {
        //instantiate dependencies and launch app
        let app = XCUIApplication()
        app.launch()
        
        //tap on Youtube button
        selector.youtubeBtn.tap()
        
        let waitForNetwork = XCTWaiter.wait(for: [expectation(description: "Wait for 2 seconds")], timeout: 4.0)
        if waitForNetwork == XCTWaiter.Result.timedOut {
            print(description)
        }
        
        //first device run: agree to dismiss youtube cookie terms
//        if app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["cookies"]/*[[".otherElements[\"BrowserView?WebViewProcessID=1739\"].webViews.webViews.webViews",".otherElements.matching(identifier: \"Before you continue to YouTube\")",".links[\"cookies\"].staticTexts[\"cookies\"]",".staticTexts[\"cookies\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.isHittable{
//            app.swipeUp()
//            selector.agreeYTCookiesBtn.doubleTap()
//
//
//            let waitForNetwork = XCTWaiter.wait(for: [expectation(description: "Wait for 2 seconds")], timeout: 2.0)
//            if waitForNetwork == XCTWaiter.Result.timedOut {
//                print(description)
//            }
//        }
        
        //asert vdo
        app.webViews.webViews.webViews.otherElements["April Fools 2017: How we blink books | Inside Blinkist, 2 minutes 49 seconds"].doubleTap()
        
        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["April Fools 2017: How we blink books | Inside Blinkist 10K views Show more"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
       // app.webViews.webViews.webViews.switches["Play video"].tap()
        
        
        let pauseVideoSwitch = app.webViews.webViews.webViews.switches["Pause video"]
        pauseVideoSwitch.tap()
        
        app.webViews.webViews.webViews.staticTexts["Time elapsed0:07"].tap()

        
        app.webViews.webViews.webViews.switches["Play video"].tap()
        //XCTAssertTrue(pauseVideoSwitch.exists)
        
        //assert video frame
        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Play video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Play video\"]",".switches[\"Play video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
        
        if waitForNetwork == XCTWaiter.Result.timedOut {
            print(description)
        }
        
        //let pauseVideoSwitch = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Pause video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Pause video\"]",".switches[\"Pause video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        pauseVideoSwitch.tap()
        
        //fix this
        
//        let app = XCUIApplication()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["April Fools 2017: How we blink books | Inside Blinkist, 2 minutes 49 seconds"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"]",".otherElements[\"YouTube Video Player\"].otherElements[\"April Fools 2017: How we blink books | Inside Blinkist, 2 minutes 49 seconds\"]",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist, 2 minutes 49 seconds\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//
//        let searchYoutubeButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Search YouTube"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"]",".otherElements[\"banner\"].buttons[\"Search YouTube\"]",".buttons[\"Search YouTube\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
//        searchYoutubeButton.tap()
//        searchYoutubeButton.tap()
//        searchYoutubeButton.tap()
//        searchYoutubeButton.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Pause video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Pause video\"]",".switches[\"Pause video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.textFields["Search YouTube"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"]",".otherElements[\"web dialog\"].textFields[\"Search YouTube\"]",".textFields[\"Search YouTube\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.webViews/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews",".webViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.webViews.webViews.otherElements["April Fools 2017: How we blink books | Inside Blinkist - YouTube"].children(matching: .other).element(boundBy: 2).buttons["Close search"].tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Previous video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"Previous video\"]",".buttons[\"Previous video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        searchYoutubeButton.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.switches["Play video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].switches[\"Play video\"]",".switches[\"Play video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["April Fools 2017: How we blink books | Inside Blinkist 10K views Show more"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Next video"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2909\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"Next video\"]",".buttons[\"Next video\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
                
    
        
        
        
//
//        let aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["April Fools 2017: How we blink books | Inside Blinkist 10K views Show more"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".buttons[\"April Fools 2017: How we blink books | Inside Blinkist 10K views Show more\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton.tap()
//        pauseVideoSwitch.tap()
//        aprilFools2017HowWeBlinkBooksInsideBlinkist10kViewsShowMoreButton.tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Description Close"]/*[[".otherElements[\"BrowserView?WebViewProcessID=2374\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].buttons[\"Description Close\"]",".buttons[\"Description Close\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
        
        
                
        
    }
}
