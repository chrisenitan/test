//Count occurences of vowels in any give string

//reduce function: finds a charater in a string and increments a persisted value for each time a character is found
let counter = (start, alphChar) => {
  const vowels = "AEIOU"
  const count = vowels.indexOf(alphChar)
  count >= 0 ? start++ : (start = start)
  return start
}
//invokes the counter and verifies response with provided expected value
let assertVowels = ({ string, shouldBe }) => {
  const arrReq = string.toUpperCase().split("")
  var vowelTotal = arrReq.reduce(counter, 0)
  vowelTotal === shouldBe
    ? console.log(`\x1b[32m 1 Test Passed: Asserted ${shouldBe} is ${vowelTotal} \x1b[0m`)
    : console.log(`\x1b[31m 1 Test Failed: Expected ${shouldBe} to be ${vowelTotal} \x1b[0m`)
}

//call the source function to start the app
//why not chai!
assertVowels({
  string: "heloAEIOU",
  shouldBe: 7,
})
