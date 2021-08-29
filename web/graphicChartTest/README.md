## Main
**Cypress based UI test for Survey and Dashboard**
- Environments: Live
- Softwares
    - Cypress
    - NPM

# Enviroment Setup
- Clone this project
- Install cypress and other dependencies
    - `npm install`

# Running a test
- Launch [Cypress Test Runner](https://docs.cypress.io/guides/core-concepts/test-runner.html#Open-files-in-your-IDE) `npx cypress open` or `npm start`
- Open Mode: Run a test by clicking on the test js file in the Run tab of the Cypress runner.
- Command Mode: From the command line in your project directory, launch cypress and run the Survey test with command `npm run surveyTest`


**Other Notes & Recommendations**
- Default preferred code formatter is Prettier.
    - Settings
```
{  
    "semi":false
    "printWidth":150
}
```