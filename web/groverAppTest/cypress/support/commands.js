//dependencies
import selector from "/cypress/fixtures/selector.json"

//assert selected sort option and second result as at least 1 movie list
Cypress.Commands.add("assertSorting", (option) => {
  cy.get(selector.chart.selectedMovieSort).contains(option)
  cy.get(selector.chart.movieList).children().eq(1)
})

//assert selected sort option and movie genre on search page
Cypress.Commands.add("reAssertGenre", (option) => {
  cy.get(selector.chart.genreList).eq(20).find("a").click()
  cy.get(selector.search.pageHeader).contains(
    `Feature Film, Rating Count at least 25,000, Western (Sorted by ${option} Descending) `
  )
  cy.go("back")
})
