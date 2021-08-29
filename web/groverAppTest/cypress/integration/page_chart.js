//dependencies
import selector from "/cypress/fixtures/selector.json"
/*
 - execute command: npx cypress run --spec 'cypress/integration/page_chart.js' --browser electron
 - custom commands are in /support/commands.js
 - selectors are in /fixtures/selector.json
*/

context("Actions", () => {
  describe("Test page sorting functionality", () => {
    //assert sorting result and selected option
    it("Page and sorting assertions", () => {
      cy.log("Begin Test: Page and sorting assertions")
      cy.visit("/")

      cy.assertSorting("Ranking")

      cy.get(selector.chart.movieSort).select("IMDb Rating")
      cy.assertSorting("IMDb Rating")

      cy.get(selector.chart.movieSort).select("Release Date")
      cy.assertSorting("Release Date")

      cy.get(selector.chart.movieSort).select("Number of Ratings")
      cy.assertSorting("Number of Ratings")

      cy.get(selector.chart.movieSort).select("Your Rating")
      cy.assertSorting("Your Rating")

      cy.log("End Test: Page and sorting assertions")
    })

    //assert sorting result and genre
    it("Sorting and Genre assertions", () => {
      cy.log("Begin Test: Sorting and Genre assertions")
      cy.visit("/")
      cy.reAssertGenre("Ranking")

      cy.get(selector.chart.movieSort).select("IMDb Rating")
      cy.reAssertGenre("IMDb Rating")

      cy.get(selector.chart.movieSort).select("Release Date")
      cy.reAssertGenre("Release Date")

      cy.get(selector.chart.movieSort).select("Number of Ratings")
      cy.reAssertGenre("Number of Ratings")

      cy.get(selector.chart.movieSort).select("Your Rating")
      cy.reAssertGenre("Your Rating")

      cy.log("End Test: Sorting and Genre assertions")
    })
  })
})
