# UI Automation Test
Open UI automation tests with test frameworks on all projects under this acconut.
Test task case study: Design and implement tests for the multiple softwares

# Introduction
- Some tests in this repository are application tasks. Disclosure has been made and there are no copyright preventing reuse or sharing of the files 

#  Test and Environment Setup
-  Clone this project in your preferred folder
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

## Approach
1.  Explored the software manually and determined/established current and expected behaviours for both apps. This was used in developing the approach and assumptions.
	1.  Expected behaviour is defined by industry software standard and no visible bug occurrences noticed.
2.  Outline test priority/scope using the 2 provided goals
	1.  Tests for the functionality in book list
	2.  Tests for the Youtube video play functionality
3.  Define test cases relevant for each story
	1.  Export cases into manual regression checklist
4.  Develop and expand cases into scenarios
	1.  Convert scenarios into global assertions and functionality tests
	2.  Polish test flow again
5.  Write automation tests
6. Review Code and task files; submission



  
