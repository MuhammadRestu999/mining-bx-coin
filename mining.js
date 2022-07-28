const axios = require("axios");
const fs = require("fs");

const { nomor: num, delay: ms } = JSON.parse(fs.readFileSync("config.json"))

if(num == "628XXXXXXXXXX") throw false

console.log("Nomor : " + num);
console.log("Delay : " + ms + "ms");
console.log("\n");
console.log("\n");
console.log("\n");

setInterval(async function() {
  axios.get("http://xiex.my.id/mining-coin/" + num).then(function({ data }) {
    if(data == "nomor tidak ada !!") {
      console.log("Umm\nCoba cek nomor HP mu\n\n");
      throw false;
    };
    console.log(data);
  });
}, ms);
