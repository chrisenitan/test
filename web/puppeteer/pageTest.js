const puppeteer = require("puppeteer")

describe("Basics", () => {
  beforeEach(async function () {
    const browser = await puppeteer.launch({
      headless: false,
      devtools: true,
    })
    const page = await browser.newPage()
    await page.setViewport({ width: 1400, height: 760 })
    await page.goto("https://www.google.com")
    Object.assign(this.currentTest, {
      browser,
      page,
    })
  })
  it("Page test", async function () {
    const browser = this.test.browser
    const page = this.test.page

    await page.waitForSelector("#L2AGLb")
    page.click("#L2AGLb", { clickCount: 2, delay: 500 })
    console.time("test: ")
    page.waitForTimeout(2000)
    console.timeEnd("test: ")
    /*  await root.page.waitForSelector("input[title='Search']")
  await root.page.type("input[title='Search']", "Hello")
  page.click("#hplogo") */
    await browser.close()
  })
})
