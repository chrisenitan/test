//require dependencies
import selector from "/cypress/fixtures/selectors.json"

context("Actions", () => {
  describe("Assert and test Survey and Dashboard page elements and funtionality", () => {
    it("Assertions: Survey status (Incomplete/complete) and live test results. Story 1 and 2", () => {
      //visit survey page
      cy.visit(Cypress.env("url").surveyBaseUrl)

      //BASIC PAGE ASSERTIONS: assert welcome hereder
      cy.get(selector.indexWelcomeBanner).contains(
        "Welcome to the quantilope QA Engineer Case Study!"
      )
      //asset main page cta
      cy.startSurvey()

      //BASIC PAGE ASSERTIONS: assert radio fields
      cy.get(selector.radioButtons).should("have.length", 3)
      cy.get('[type="radio"]').should("have.length", 3)

      //BASIC PAGE ASSERTIONS: assert default state for quesion 1
      cy.get('[type="radio"]').should("not.be.checked")

      //get existing survey totals
      cy.visit(Cypress.env("url").dashBoardBaseUrl)
      cy.wait(1000)

      //BASIC PAGE ASSERTIONS: assert graphs titles
      cy.get(selector.graphTitle).should("have.length", 3)
      cy.get(selector.graphTitle).contains("q2 how many engineers")
      cy.get(selector.graphTitle).contains("q3 rating")
      cy.get(selector.graphTitle).contains("q1 favorite color")

      cy.get(selector.responseTotal)
        .eq(0)
        .then(($value) => {
          var totalString = $value.text()
          var currentTotalNumber = Number(totalString.slice(9, 11))

          //visit survey page
          cy.visit(Cypress.env("url").surveyBaseUrl)

          //BASIC PAGE ASSERTIONS: assert page form
          cy.get(selector.questionBanner).contains(
            "What is your favorite color?"
          )

          //TEST FOR BLUE
          cy.wait(1000)
          cy.get(selector.radioButtons).eq(0).click()
          cy.wait(1000)

          //click next to save answer
          cy.get(selector.nextButton).click()

          //assert changes on dashboard
          cy.visit(Cypress.env("url").dashBoardBaseUrl)
          cy.wait(1000)

          //assert graphs are visible
          cy.get(selector.graphs).should("be.visible")

          //assert total +1
          var expectedTotalNumber = currentTotalNumber + 1
          cy.get(selector.responseTotal).eq(0).contains(expectedTotalNumber)

          //do other dashbard

          //revisit survey to continue question 2
          cy.visit(Cypress.env("url").surveyBaseUrl)

          //type into question2
          cy.get(selector.questionTwoInput).type("2")

          //click next
          cy.get(selector.nextButton).click()

          //assert changes on dashboard
          cy.visit(Cypress.env("url").dashBoardBaseUrl)
          cy.wait(1000)

          //assert graphs are visible
          cy.get(selector.graphs).should("be.visible")

          //assert q2
          cy.wait(1000)
          cy.get(selector.graphData)
            .eq(1)
            .should("have.attr", "fill", "#f8e71c")

          //assert q3
          cy.wait(1000)
          cy.get(selector.graphData)
            .eq(0)
            .should("have.attr", "fill", "#6EBE6D")

          //assert all graphs contain 100% result
          cy.get(selector.responsePercent).contains("100.0%")
        })
        cy.log("End Test: Assertions: Survey status (Incomplete/complete) and live test results. Story 1 and 2")
    })

    it("Response sorting. 3, 4 and 5: Yellow", () => {

      //get existing survey totals
      cy.visit(Cypress.env("url").dashBoardBaseUrl)
      cy.wait(1000)

      cy.get(selector.responseTotal)
        .eq(0)
        .then(($value) => {
          var totalString = $value.text()
          var currentTotalNumber = Number(totalString.slice(9, 11))

          //visit survey page
          cy.visit(Cypress.env("url").surveyBaseUrl)

          //asset main page cta
          cy.startSurvey()

          //TEST FOR YELLOW
          cy.get(selector.radioButtons).eq(0).click()
          cy.wait(500)

          //click next
          cy.wait(500)
          cy.get(selector.nextButton).click()
          cy.wait(500)

          //type into question2
          cy.get(selector.questionTwoInput).type("2")

          //click next
          cy.get(selector.nextButton).click()

          //select option 3 on question 3
          cy.get(selector.radioButtons).eq(2).click()
          cy.wait(500)

          //click next
          cy.get(selector.nextButton).click()

          //assert changes on dashboard
          cy.visit(Cypress.env("url").dashBoardBaseUrl)
          cy.wait(1000)

          //assert graphs are visible
          cy.get(selector.graphs).should("be.visible")

          //assert q2
          cy.wait(1000)
          cy.get(selector.graphData)
            .eq(1)
            .should("have.attr", "fill", "#092de9")

          //assert q3
          cy.wait(1000)
          cy.get(selector.graphData)
            .eq(0)
            .should("have.attr", "fill", "#6EBE6D")

          //assert all graphs contain 100% result
          cy.get(selector.responsePercent).contains("100.0%")

          //assert total +1
          var expectedTotalNumber = currentTotalNumber + 1
          cy.get(selector.responseTotal).eq(0).contains(expectedTotalNumber)
        })

      //assert graphs are visible
      cy.get(selector.graphs).should("be.visible")

      //assert q1 graph
      cy.wait(1000)
      cy.get(selector.graphData).eq(1).should("have.attr", "fill", "#092de9")

      //assert q3
      cy.wait(1000)
      cy.get(selector.graphData).eq(0).should("have.attr", "fill", "#6EBE6D")

      //assert all graphs contain 100% result
      cy.get(selector.responsePercent).contains("100.0%")
    })

    it("Response sorting. 3, 4 and 5: Red", () => {
      //Survey assertions

      //get existing survey totals
      cy.visit(Cypress.env("url").dashBoardBaseUrl)
      cy.wait(1000)

      cy.get(selector.responseTotal)
        .eq(0)
        .then(($value) => {
          var totalString = $value.text()
          var currentTotalNumber = Number(totalString.slice(9, 11))

          //visit survey page
          cy.visit(Cypress.env("url").surveyBaseUrl)

          //asset main page cta
          cy.startSurvey()

          //TEST FOR RED
          cy.get(selector.radioButtons).eq(1).click()
          cy.wait(500)

          //click next
          cy.wait(500)
          cy.get(selector.nextButton).click()
          cy.wait(500)

          //type into question2
          cy.get(selector.questionTwoInput).type("2")

          //click next
          cy.get(selector.nextButton).click()

          //select option 3 on question 3
          cy.get(selector.radioButtons).eq(2).click()
          cy.wait(500)

          //click next
          cy.get(selector.nextButton).click()

          //assert changes on dashboard
          cy.visit(Cypress.env("url").dashBoardBaseUrl)
          cy.wait(1000)

          //assert graphs are visible
          cy.get(selector.graphs).should("be.visible")

          //assert total is not incremented
          var expectedTotalNumber = currentTotalNumber
          cy.get(selector.responseTotal).eq(0).contains(expectedTotalNumber)
        })
    })
  })
})
