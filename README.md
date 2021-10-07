# UI Automation Test

Open UI automation tests with test frameworks on all projects under this acconut.
Test task case study: Design and implement tests for the multiple softwares

# Introduction

- This is a monorepo containing web, iOS, API and Android tests

# Frameworks

| web     | web/api | web/api | web/api   | ios    | android  |
| ------- | ------- | ------- | --------- | ------ | -------- |
| Cypress | Mocha   | Chai    | Puppeteer | XCTest | Espresso |

# Test and Environment Setup

- Clone this project in your preferred folder
  - The folder named after each platform contains the relateed test projects

**Running tests for the Web project**

- Launch [Cypress Test Runner](https://docs.cypress.io/guides/core-concepts/test-runner.html#Open-files-in-your-IDE) `npx cypress open` or `npm start`
- Open Mode: Run a test by clicking on the test js file in the Run tab of the Cypress runner.
- Command Mode: From the command line in your project directory, launch cypress and run the Survey test with command `npm run surveyTest`

**Running tests for the Android project**

1. Import project in Android Studio
2. Build project
3. Select and run the default run configuration `BooksActivityTest_Config.run` and any installed mobile device and click run button
   1. Tests are in the directory `app/src/androidTest/kotlin/BooksActivityTest.kt`
   2. Run configurations are in `QAAutomationChallenge-Android/BooksActivityTest_Config.run.xml`

**Running tests for the iOS project**

1. Import project in XCode
2. Build project
   1. Tests are in the directory `QAAutomationChallenge-iOS/TestingChallengeUI_Tests/TestingChallengeUI_Tests.swift`
   2. Run configurations are in `TestingChallengeUI_Tests/TestingChallenge.xctestplan`
