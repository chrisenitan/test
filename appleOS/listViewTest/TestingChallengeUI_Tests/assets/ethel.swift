//
//  index.swift
//  TestingChallengeUI_Tests
//
//  Created by Chris Enitan on 15.07.21.
//  Copyright © 2021 Blinks Labs GmbH. All rights reserved.
//

import XCTest

let app = XCUIApplication()

struct selector {
    //general app selectors
    //general
    static var appName = "Blinkist Code Challenge"
    static var tables = app.tables
    static var appWebViewBtn = app.webViews.webViews.webViews.buttons
    static var okButton = app.alerts["Notice"].scrollViews.otherElements.buttons["OK"]
    static var appHeaderTitle = app.navigationBars[appName].staticTexts[appName]
    //youtube
    static var youtubeBtn = app.navigationBars.buttons["YouTube"]
    static var youtubeCookieText = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["cookies"]/*[[".otherElements[\"BrowserView?WebViewProcessID=1739\"].webViews.webViews.webViews",".otherElements.matching(identifier: \"Before you continue to YouTube\")",".links[\"cookies\"].staticTexts[\"cookies\"]",".staticTexts[\"cookies\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
    static var agreeYTCookiesBtn = appWebViewBtn["Agree to the use of cookies and other data for the purposes described"]
    static var videoDescription = appWebViewBtn["April Fools 2017: How we blink books | Inside Blinkist 10K views Show more"]
    static var youtubePageBanner = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["banner"]/*[[".otherElements[\"BrowserView?WebViewProcessID=99273\"].webViews.webViews.webViews",".otherElements[\"April Fools 2017: How we blink books | Inside Blinkist - YouTube\"].otherElements[\"banner\"]",".otherElements[\"banner\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .link)["YouTube"].children(matching: .link)["YouTube"]
}

//general app actions
class Command {
    //asserts app prompts
    func assertPrompt(req: String){
        let promptPredicate = NSPredicate(format: "label LIKE %@", req)
        XCTAssert(app.alerts.scrollViews.otherElements.staticTexts.element(matching: promptPredicate).isHittable)
    }
    //asserts book is active in view
    func assertBook(req: String){
        let bookPredicate = NSPredicate(format: "label LIKE %@", req)
        XCTAssert(selector.tables.staticTexts.element(matching: bookPredicate).isHittable)
    }
    //tap on a book in viewport
    func tapBook(req: String){
        let tapPredicate = NSPredicate(format: "label LIKE %@", req)
        app.tables.cells.staticTexts.element(matching: tapPredicate).tap()
    }
}

//reusable book objects
struct testBooks {
    let id99c1c39 = (
        name: "A Book With a Very Long Title, Veeeeeeeeeeeeeeeeery Long, Possibly the Most Long Title For a Book You've Ever Seen In Your Entire Life",
        author: "The Blinkist Android Team"
    )
    let idd241b2b = (
        name: "Eat, Move, Sleep",
        author: "Tom Rath"
    )
    let id2cb8609 = (
        name: "Inner Engineering",
        author: "Sadhguru Jaggi Vasudev"
    )
}
