const puppeteer = require("puppeteer")

;(async () => {
  //let movieUrl = "https://www.wikipedia.org/"
  let movieUrl = "https://www.google.com"

  let browser = await puppeteer.launch({ headless: false })
  let page = await browser.newPage()

  await page.goto(movieUrl, {
    waitUntil: "networkidle2",
  })

  let data = await page.evaluate(() => {
    var luckyFeeling = document.getElementById("gbqfbb").value
    var agree = document.getElementById("L2AGLb")
    return {
      luckyFeeling,
      agree,
    }
  })

  await page.goto(movieUrl)
  await page.waitForSelector("#L2AGLb")
  page.click("#L2AGLb", { clickCount: 2, delay: 1000 })
  page.click("#gbqfbb")
  //page.click("#js-link-box-pl")

  //console.log(data)

  //await browser.close()
})()
