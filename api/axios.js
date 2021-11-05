//api tests with Axios http client
const axios = require("axios").default

axios({
  method: "GET",
  url: "https://jsonplaceholder.typicode.com/todos/1"
}).then((response) => {
  console.log(response.data)
})