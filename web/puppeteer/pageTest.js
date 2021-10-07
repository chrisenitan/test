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
    await page.screenshot({
      type: "png",
      path: "puppeteer/screenshots/cookies.png",
      fullpage: true,
    })
    console.time("test: ")
    await page.waitForTimeout(2000)
    console.timeEnd("test: ")
    /*  await root.page.waitForSelector("input[title='Search']")
  await root.page.type("input[title='Search']", "Hello")
  page.click("#hplogo") */
    await browser.close()
  })

  it("Reload a screenshot", async function () {
    const browser = this.test.browser
    const page = this.test.page

    await page.waitForSelector("#S3BnEe")
    await page.reload()
    //console.log(process.cwd())
    await page.click("#L2AGLb", { clickCount: 2, delay: 500 })
    await page.type('[name="q"]', "Google", { delay: 500 })
    await page.screenshot({
      type: "png",
      path: "puppeteer/screenshots/index.png",
      fullpage: true,
    })
    await browser.close()
  })
})
