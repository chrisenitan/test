import selector from '../fixtures/selectors'

Cypress.Commands.add("startSurvey", (req) => {
    cy.get(selector.getStartedButton).contains("Get Started").click()
})