const readline = require('readline');

const reader = readline.createInterface({
    
    input: process.stdin,
    output: process.stdout
  });

function addNumbers(sum, numsleft, cb) {
    if (numsleft === 0) {
        cb(sum)
    } else if (numsleft > 0) {
        reader.question("Number plz: ", function(answer) {
            let parsed = parseInt(answer)
            sum += parsed
            console.log(sum)
            addNumbers(sum, numsleft - 1, cb)
        })
    }
}


// addNumbers(0, 3, function(sum) { 
//     console.log(`Total Sum: ${sum}`)
//     reader.close()}); 

// let func = function (num) {
//     console.log(num)
// }

// function func (num) {
//     console.log(num)
// }

// let func = num => console.log(num)